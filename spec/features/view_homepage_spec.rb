# As a user
# In order to pick a student
# The students should display on the screen, with their names and when they were last called

feature "Home Page" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Student Picker")
  end

  scenario "shows a list of students" do
    @student1 = Fabricate(:student, name: "Wendy", last_called: "yesterday")
    @student2 = Fabricate(:student, name: "Joe", last_called: "yesterday")
    expect(Student.count).to eq 2

    visit '/'
    expect(page).to have_content("Students:")
    expect(page).to have_content("Wendy")
    expect(page).to have_content("Joe")
  end
end
