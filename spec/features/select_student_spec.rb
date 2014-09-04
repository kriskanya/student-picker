# As a user
# In order to select a student who has not been recently called on
# I want to be able to pick a random student

feature "Select Student" do
  context "students have been added" do
    context "some students have not been picked recently" do
      before(:each) do
        @student1 = Fabricate(:student, name: "Wendy", last_called: Time.new(2014, 9, 1))
        @student2 = Fabricate(:student, name: "Joe", last_called: Time.new(2014, 9, 2))
      end

      scenario "random student is selected" do
        visit '/'
        click_on "Pick Someone"
        expect(page).to have_content("You have picked")
        expect(page).to have_content("less than a minute")
      end
    end

    context "all students have been picked recently" do
      before(:each) do
        @student1 = Fabricate(:student, name: "Wendy", last_called: Time.now)
        @student2 = Fabricate(:student, name: "Joe", last_called: Time.now)
      end

      scenario "user is notified that all student have been picked recently" do
        visit '/'
        click_on "Pick Someone"
        expect(page).to have_content("Sorry, all students picked in last hour")
      end
    end
  end

  context "no students have been added" do
    scenario "user is notified that no students have been added" do
      visit '/'
      click_on "Pick Someone"
      expect(page).to have_content("You must add a student first")
    end
  end
end
