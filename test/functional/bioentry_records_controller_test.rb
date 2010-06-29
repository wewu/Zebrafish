require File.dirname(__FILE__) + '/../test_helper'
require 'bioentry_records_controller'

# Re-raise errors caught by the controller.
class BioentryRecordsController; def rescue_action(e) raise e end; end

class BioentryRecordsControllerTest < Test::Unit::TestCase
  fixtures :bioentry_records

  def setup
    @controller = BioentryRecordsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:bioentry_records)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:bioentry_records)
    assert assigns(:bioentry_records).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:bioentry_records)
  end

  def test_create
    num_bioentry_records = BioentryRecords.count

    post :create, :bioentry_records => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_bioentry_records + 1, BioentryRecords.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:bioentry_records)
    assert assigns(:bioentry_records).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil BioentryRecords.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      BioentryRecords.find(1)
    }
  end
end
