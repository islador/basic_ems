#Create a couple students
s1 = Student.create(name: "Student 1")
s2 = Student.create(name: "Student 2")
Student.create(name: "Student 3")

#Create two courses
h101 = Course.create(name: "History 101")
cs101 = Course.create(name: "CompSci 101")

#Create 3 assignments for History 101
h101.assignments.create(name: "Countries Essay", start_date: Date.today, due_date: Date.today+7, max_points: 100, description: "Write an essay on a country.")
h101.assignments.create(name: "Capitals Essay", start_date: Date.today+2, due_date: Date.today+9, max_points: 100, description: "Write an essay on a country's capital.")
h101.assignments.create(name: "VIP Essay", start_date: Date.today+3, due_date: Date.today+10, max_points: 100, description: "Write an essay on a country's national hero.")

#Create 3 assignments for CompSci 101
cs101.assignments.create(name: "Binary Counting for Dummies", start_date: Date.today, due_date: Date.today+1, max_points: 2, description: "Learn to count in binary!")
cs101.assignments.create(name: "Hex Counting for Dummies", start_date: Date.today+1, due_date: Date.today+2, max_points: 5, description: "Learn to count in hex!")
cs101.assignments.create(name: "Hello World", start_date: Date.today+2, due_date: Date.today+3, max_points: 2, description: "Write your first program")

#Enroll Student 1 in History 101
EnrolledStudent.create(student_id: s1.id, course_id: h101.id)

#Enroll Student 2 in CompSci 101
EnrolledStudent.create(student_id: s2.id, course_id: cs101.id)