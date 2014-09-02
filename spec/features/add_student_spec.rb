# As a user
# In order to add a student
# The user should navigate to the new students page and be able to add a student

feature "Add Student Page" do
  scenario "is displayed when navigating to students/new" do
    visit "/"
    click_on "Add Student"
    expect(page).to have_content("Add Student")
  end

  scenario " - student is persisted to the database when the user fills out and submits the form" do
    visit '/'
    click_on "Add Student"
    fill_in "Name", with: "Sally"
    click_on "Create Student"
    expect(Student.count).to eq 1
    # page.should have_content("Student named Sally has been created")
    current_path.should == root_path
    within("ul#students") do
      page.should have_content("Sally")
    end
  end

  scenario " - student is not created" do
    visit '/'
    click_on 'Add Student'
    fill_in "Name", with: ""
    click_on "Create Student"
    expect(Student.count).to eq 0
    page.should have_content("can't be blank")
  end
end
