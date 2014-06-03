# EMS Basic - A rough Education Management Concept.

## Description
EMS Basic demonstrates the core framework for student, course and assignment management. The current iteration lacks authentication and authorization, but supports the core features listed below.

1. Course Creation
 - Courses may be created easily. With authorization, this could be easily modified to lock out non-faculty members.
2. Assignment Creation
 - Assignments may be created at one point for each course.
3. Per Student Assignments
 - Assignments are semi-duplicated to all students enrolled in a given course. This allows for students to receive individual grades and teachers to easily receive numerous assignments.


## Setup
1. bundle install
2. rake db:setup
3. rails server

## Model Descriptions
1. Student
 - A student is exactly what it sounds like, a simple student looking to get some work done.
2. Course
 - A course is exactly what it sounds like, a simple course with assignments and what have you
3. Assignment
 - A course assignment, each assignment belongs to a course and acts as the first half of a student's assignment.
4. Enrolled Student
 - An Enrolled Student represents the connection between a student and a course. When a student is enrolled in a course, the association is modeled with an Enrolled Student object. Enrolled Students have Enrolled Student Assignments.
5. Enrolled Student Assignments
 - An Enrolled Student Assignment is the second half of a course assignment. That is, it contains the student specific data of the assignment, such as submission date and earned points.

## Seeds
EMS Basic comes with a simple set of seeded data. This includes two courses, three students, and three assignments for each course.

Student One is enrolled in History 101, Student Two is enrolled in CompSci 101, and Student Three is a free floating student for you to play with.

It is possible to add assignments to a course by going to root/students/:student_id/courses/:id. The evolution of this would be to make the add assignment button available to teachers only.

New assignments are distributed to a courses existing students via the course's enrolled_student association. In this fashion, an assignment may be added to the course at any time.

The basic columns and other data attributes for grades are in place, however a grading system should be built AFTER an authentication/authorization system is in place.