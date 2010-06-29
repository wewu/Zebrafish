require File.dirname(__FILE__) + '/../test_helper'
require 'term_controller'

# Re-raise errors caught by the controller.
class TermController; def rescue_action(e) raise e end; end

class TermControllerTest < Test::Unit::TestCase
  fixtures :biodatabases

  def setup
    @controller = TermController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_Ontology
    get :Ontology
    assert_response :success
    assert_template 'Ontology'
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

    assert_not_nil assigns(:biodatabases)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:biodatabase)
    assert assigns(:biodatabase).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:biodatabase)
  end

  def test_create
    num_biodatabases = Biodatabase.count

    post :create, :biodatabase => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_biodatabases + 1, Biodatabase.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:biodatabase)
    assert assigns(:biodatabase).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Biodatabase.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Biodatabase.find(1)
    }
  end
end
