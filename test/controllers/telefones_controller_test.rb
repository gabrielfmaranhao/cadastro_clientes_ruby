require "test_helper"

class TelefonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telefone = telefones(:one)
  end

  test "should get index" do
    get telefones_url, as: :json
    assert_response :success
  end

  test "should create telefone" do
    assert_difference("Telefone.count") do
      post telefones_url, params: { telefone: { cliente_id: @telefone.cliente_id, number: @telefone.number } }, as: :json
    end

    assert_response :created
  end

  test "should show telefone" do
    get telefone_url(@telefone), as: :json
    assert_response :success
  end

  test "should update telefone" do
    patch telefone_url(@telefone), params: { telefone: { cliente_id: @telefone.cliente_id, number: @telefone.number } }, as: :json
    assert_response :success
  end

  test "should destroy telefone" do
    assert_difference("Telefone.count", -1) do
      delete telefone_url(@telefone), as: :json
    end

    assert_response :no_content
  end
end
