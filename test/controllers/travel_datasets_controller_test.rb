require 'test_helper'

class TravelDatasetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_dataset = travel_datasets(:one)
  end

  test "should get index" do
    get travel_datasets_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_dataset_url
    assert_response :success
  end

  test "should create travel_dataset" do
    assert_difference('TravelDataset.count') do
      post travel_datasets_url, params: { travel_dataset: { description: @travel_dataset.description, name: @travel_dataset.name } }
    end

    assert_redirected_to travel_dataset_url(TravelDataset.last)
  end

  test "should show travel_dataset" do
    get travel_dataset_url(@travel_dataset)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_dataset_url(@travel_dataset)
    assert_response :success
  end

  test "should update travel_dataset" do
    patch travel_dataset_url(@travel_dataset), params: { travel_dataset: { description: @travel_dataset.description, name: @travel_dataset.name } }
    assert_redirected_to travel_dataset_url(@travel_dataset)
  end

  test "should destroy travel_dataset" do
    assert_difference('TravelDataset.count', -1) do
      delete travel_dataset_url(@travel_dataset)
    end

    assert_redirected_to travel_datasets_url
  end
end
