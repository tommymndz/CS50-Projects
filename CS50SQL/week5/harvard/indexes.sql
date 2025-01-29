--Find a student’s historical course enrollments, based on their ID--
CREATE INDEX "student_index" ON "enrollments" ("student_id");

--Find all students who enrolled in Computer Science 50 in Fall 2023--
CREATE INDEX "courses_index" ON "enrollments" ("course_id");

--Find the requirement satisfied by “Advanced Databases” in Fall 2023--
CREATE INDEX "course_satisfies" ON "satisfies" ("course_id");
CREATE INDEX "course_title" ON "courses" ("title");

--Search for a course by title and semester--
CREATE INDEX "course_semester" ON "courses" ("semester");
