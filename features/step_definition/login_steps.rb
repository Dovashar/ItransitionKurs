#require 'watir-webdriver'
#require "watir-webdriver/wait"

require 'rubygems'
require 'capybara' 
require 'capybara/dsl'
require 'selenium-webdriver'


Capybara.current_driver = :selenium
Capybara.app_host = "http://pmvtool-test.demohoster.com/pmvtool/login/" 


Given(/^I on "(.*?)"$/) do |page|
	page = Capybara.visit("")
end

When(/^I fill username with "(.*?)"$/) do |name|
	Capybara.fill_in('j_username', :with => "silver@gmail.com")
#	BROWSER.text_field(:name => "j_username").set "silver@gmail.com"
end

When(/^I fill password with "(.*?)"$/) do |name|
	Capybara.fill_in('j_password', :with => "123456qW")

#	BROWSER.text_field(:name => "j_password").set "123456qW"
end

When(/^I press on "(.*?)"$/) do |text|
	Capybara.click_on('LOGIN')
#	BROWSER.button(:text => "LOGIN").click
end

Then(/^I should see "(.*?)"$/) do |text|
	Capybara.has_text?('Welcome to Worthworm!')
end




Given(/^I logged in$/) do
	Capybara.has_text?('Welcome to Worthworm!')
#	BROWSER.text.include? "Welcome to Worthworm!"
end

When(/^I press "(.*?)"$/) do |button|
		sleep(7)
		Capybara.find(:xpath, ".//button[contains(text(),'+ CREATE VENTURE')]").click
end

When(/^I fill "(.*?)" with (\d+) letters$/) do |arg1, arg2|
	arg1 = Capybara.find(:xpath, "html/body/div[5]/div/table/tbody/tr[2]/td[2]/div/div/table/tbody/tr[2]/td/div/div[1]/div[2]/div/input").set "ARARAAR"
	arg2 = Capybara.find(:xpath, "html/body/div[5]/div/table/tbody/tr[2]/td[2]/div/div/table/tbody/tr[2]/td/div/div[2]/div[2]/input").set "ARARAAR"
end

When(/^I select "(.*?)" in drop\-down menu$/) do |arg1|
	Capybara.find(:xpath, "html/body/div[5]/div/table/tbody/tr[2]/td[2]/div/div/table/tbody/tr[2]/td/div/div[3]/div[2]/div/div/a").click
	Capybara.find(:xpath, "html/body/div[5]/div/table/tbody/tr[2]/td[2]/div/div/table/tbody/tr[2]/td/div/div[3]/div[2]/div/div/div/ul/li[4]").click
end

Then(/^I should see (\d+) letters from "(.*?)"$/) do |arg1|
	Capybara.find(:xpath, ".//div/div[1]/h2/div").has_text? "ARARAAR"
end




After do |scenario|
	if (scenario.failed?)
    Capybara.save_screenshot("#{scenario.__id__}.png")
    embed("#{scenario.__id__}.png", "image/png", "SCREENSHOT")
end
end