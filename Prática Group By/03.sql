SELECT users.name AS writer, COUNT(testimonials) AS testimonialCount FROM users JOIN testimonials ON users.id=testimonials."writerId" GROUP BY users.id;
