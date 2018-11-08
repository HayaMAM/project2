Subject.destroy_all

subjects = ["Maths", "Physics", "Chemistry", "Biology", "Language Arts", "Religious Studies", "Social Studies", "History", "Computer Science"]
subjects.each do |g|
  Subject.create(name: g)
end
