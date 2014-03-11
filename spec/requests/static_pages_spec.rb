require 'spec_helper'


describe "Static pages" do

  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit root_path  #'/static_pages/home'
      expect(page).to have_content('Sample App')
    end
    it "should have the title 'Home'" do
      visit root_path  #'/static_pages/home'
      expect(page).to have_title("CS 232 Rails Development | Home")
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit static_pages_help_path   #'/static_pages/help'
      expect(page).to have_content('Help')
    end
    it "should have the title 'Help'" do
      visit static_pages_help_path   #'/static_pages/help'
      expect(page).to have_title("CS 232 Rails Development | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit static_pages_about_path   #'/static_pages/about'
      expect(page).to have_content('About Us')
    end
    it "should have the title 'About Us'" do
      visit static_pages_about_path   #'/static_pages/about'
      expect(page).to have_title("CS 232 Rails Development | About Us")
    end
  end

  describe "Contact page" do
    it "should have title 'CS 232 Rails Development | Contact'" do
      visit static_pages_contact_path  #'/static_pages/contact'
      expect(page).to have_title("CS 232 Rails Development | Contact")
    end

    it "should contain the words 'CS 232 Contact'" do
      visit static_pages_contact_path  #'/static_pages/contact'
      expect(page).to have_content("CS 232 Contact")
    end

    it "should contain an H1 element with class 'page-title'" do
      visit static_pages_contact_path  #'/static_pages/contact'
      expect(page).to have_selector("h1.page-title")
    end

    it "should contain a definition list with a <dl>" do
      visit static_pages_contact_path  #'/static_pages/contact'
      expect(page).to have_selector('dl')
    end

    it "should contain a <dt> element" do
      visit static_pages_contact_path  #'/static_pages/contact'
      expect(page).to have_selector('dt')
    end

    it "should contain a <dd> element" do
      visit static_pages_contact_path  #'/static_pages/contact'
      expect(page).to have_selector('dd')
    end

    it "should contain a <section class='main'> element" do
      visit static_pages_contact_path  #'/static_pages/contact'
      expect(page).to have_selector('section.main')
    end

    it "should contain a 'h1.page-title' selector in the CSS" do
      visit static_pages_contact_path  #'/static_pages/contact'
      expect(page).to have_css('h1.page-title')
    end

    it "should contain a '.main' selector in the CSS" do
      visit static_pages_contact_path  #'/static_pages/contact'
      expect(page).to have_css('.main')
    end

  end

end


