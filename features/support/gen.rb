module Gen

  def self.given_customer_data_by_number(num)
    data = DataStorage.extract('customer_data', num.to_i)
    unless data
      data = Gen::customer_data
      DataStorage.store('customer_data', num.to_i, data)
    end
    data
  end

  def self.customer_data
    params = {
        name: "CustomerName #{DataGenerator::Gen.serial}",
        e_mail: gen_user_name,
        category: "Category #{DataGenerator::Gen.serial}",
        description: "Description #{DataGenerator::Gen.serial}"
    }
    CustomerData.new params
  end

  private

  class CustomerData < Object
    attr_reader :name, :e_mail, :category, :description, :file

    def initialize(params={})
      @name = params.delete(:name)
      @e_mail = params.delete(:e_mail)
      @category = params.delete(:category)
      @description = params.delete(:description)
    end
  end
end