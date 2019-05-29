require 'site_prism'
class OrderPage < SitePrism::Page
  include Capybara::DSL

  #definiindo os elementos com siteprism
  element :nome,"input[formcontrolname=name]"
  element :email,"input[formcontrolname=email]"
  element :email_confirmation,"input[formcontrolname=emailConfirmation]"
  element :rua,"input[formcontrolname=address]" 
  element :numero,"input[formcontrolname=number]"
  element :complemento, "input[formcontrolname=optionalAddress]"

  def fill_user_data(user)
    
    nome.set user[:nome]
    email.set user[:email]
    email_confirmation.set user [:email]
    rua.set user[:rua]
    numero.set user[:numero]
    complemento.set user[:complemento]

  end

  def select_pay(payment)
    payopt = find("mt-radio[formcontrolname=paymentOption]")
    payopt.find("div", text: payment).find("div").click
  end

  def checkout(payment)
    self.select_pay(payment)
    click_button "Finalizar Pedido"
  end

  def cost_shipping
    div = find("div[class*=col-sm-6]", text: "Frete e Total:")
    div.all("table tbody tr")
  end

  def summary
    find(".content")
  end
end
