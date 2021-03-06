require 'spec_helper'

def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end


describe "Static pages - " do
  subject { page }

  describe "Home page - " do
    before {visit root_path}
    it { should have_content('Sample App') }
    it { should have_title(full_title(''))}
    it { should_not have_title('| Home') }

    describe "for signed in users" do
      let(:user) {FactoryGirl.create(:user)}
      before do
        FactoryGirl.create(:micropost, user: user, content: "lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "folor amaty")
        sign_in user
        visit root_path
      end

      it "should render the users feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end

    end # "for signed in users"
  end # "Home page - "

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end

  describe "Contact page - " do
    before {visit contact_path}
    it "should have title 'Ruby on Rails Tutorial Sample App | Contact'" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
    end

    it "should contain the words 'CS 232 Contact'" do
      expect(page).to have_content("CS 232 Contact")
    end

    it "should contain an H1 element with class 'page-title'" do
      expect(page).to have_selector("h1.page-title")
    end

    it "should contain a definition list with a <dl>" do
      expect(page).to have_selector('dl')
    end

    it "should contain a <dt> element" do
      expect(page).to have_selector('dt')
    end

    it "should contain a <dd> element" do
      expect(page).to have_selector('dd')
    end

    it "should contain a <section class='main'> element" do
      expect(page).to have_selector('section.main')
    end

    it "should contain a 'h1.page-title' selector in the CSS" do
      expect(page).to have_css('h1.page-title')
    end

    it "should contain a '.main' selector in the CSS" do
      expect(page).to have_css('.main')
    end

  end

end


