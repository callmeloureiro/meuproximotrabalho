class AddFieldsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :fantasy_name, :string
    add_column :companies, :company_name, :string
    add_column :companies, :description_company, :text
    add_column :companies, :cnpj, :string
    add_column :companies, :sector_compny, :string
    add_column :companies, :company_size, :string
    add_column :companies, :zipcode, :string
    add_column :companies, :state, :string
    add_column :companies, :city, :string
    add_column :companies, :district, :string
    add_column :companies, :address, :string
    add_column :companies, :number, :string
    add_column :companies, :complement, :string
    add_column :companies, :telphone1, :string
    add_column :companies, :telphone2, :string
    add_column :companies, :website, :string
  end
end
