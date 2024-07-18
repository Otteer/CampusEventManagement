package com.example.demo.dao;

import com.example.demo.model.Event;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class EventDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Event> getAllEvents() {
        String sql = "SELECT e.*, COUNT(er.id) AS registered_students " +
                "FROM events e " +
                "LEFT JOIN event_registrations er ON e.id = er.event_id " +
                "GROUP BY e.id";
        return jdbcTemplate.query(sql, this::mapRowToEvent);
    }

    private Event mapRowToEvent(ResultSet rs, int rowNum) throws SQLException {
        return new Event(
                rs.getLong("id"),
                rs.getString("name"),
                rs.getString("description"),
                rs.getObject("start_datetime", LocalDateTime.class),
                rs.getObject("end_datetime", LocalDateTime.class),
                rs.getInt("registered_students")
        );
    }

    public void createEvent(Event event) {
        String sql = "INSERT INTO events (name, description, start_datetime, end_datetime) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, event.getName(), event.getDescription(), event.getStartDateTime(), event.getEndDateTime());
    }

    public Event getEventById(Long id) {
        String sql = "SELECT e.*, COUNT(er.id) AS registered_students " +
                "FROM events e " +
                "LEFT JOIN event_registrations er ON e.id = er.event_id " +
                "WHERE e.id = ? " +
                "GROUP BY e.id";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, this::mapRowToEvent);
    }

    public void updateEvent(Event event) {
        String sql = "UPDATE events SET name = ?, description = ?, start_datetime = ?, end_datetime = ? WHERE id = ?";
        jdbcTemplate.update(sql, event.getName(), event.getDescription(), event.getStartDateTime(), event.getEndDateTime(), event.getId());
    }

    public void deleteEvent(Long id) {
        // Delete registrations for the event first
        String deleteRegistrationsSQL = "DELETE FROM event_registrations WHERE event_id = ?";
        jdbcTemplate.update(deleteRegistrationsSQL, id);

        // Then delete the event
        String deleteEventSQL = "DELETE FROM events WHERE id = ?";
        jdbcTemplate.update(deleteEventSQL, id);
    }

    public void registerForEvent(User user, Event event) {
        String sql = "SELECT COUNT(*) FROM event_registrations WHERE user_id = ? AND event_id = ?";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{user.getId(), event.getId()}, Integer.class);
        if (count == 0) {
            sql = "INSERT INTO event_registrations (user_id, event_id, registered_at) VALUES (?, ?, ?)";
            jdbcTemplate.update(sql, user.getId(), event.getId(), LocalDateTime.now());
        }
    }
}