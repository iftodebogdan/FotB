require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, :profile => { :email => @profile.email, :gtalk => @profile.gtalk, :location => @profile.location, :msn => @profile.msn, :name => @profile.name, :skype => @profile.skype, :user_id => @profile.user_id, :website => @profile.website, :yahoo => @profile.yahoo }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, :id => @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @profile
    assert_response :success
  end

  test "should update profile" do
    put :update, :id => @profile, :profile => { :email => @profile.email, :gtalk => @profile.gtalk, :location => @profile.location, :msn => @profile.msn, :name => @profile.name, :skype => @profile.skype, :user_id => @profile.user_id, :website => @profile.website, :yahoo => @profile.yahoo }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, :id => @profile
    end

    assert_redirected_to profiles_path
  end
end