class MenuitemsController < ApplicationController
  def index
    @menus = Menu.find_by(name: selected_menu)
    @menuitems = Menuitem.find_by(name: selected_menuitem)
    render "menu"
  end

  def show
    array = params[:menuitem_name].split("/")
    session[:menuitem] = array[0]
    redirect_to menuitems_path
  end

  def edit
    session[:menu] = params[:menu_name]
    redirect_to menuitems_path
  end

  def create
    menu_name = params[:name]
    id = Menu.find_by(name: menu_name).id
    menuitem_name = params[:menuitem_name]
    description = params[:description]
    price = params[:price]
    category_name = params[:category_name]
    img_addr = params[:img_addr]

    Menuitem.create!(menu_id: id,
                     name: menuitem_name,
                     description: description,
                     price: price,
                     category_name: category_name,
                     imgaddr: img_addr)

    redirect_to menus_path
  end

  def destroy
    id = params[:id]
    menu_item = Menuitem.find_by(id: id)
    menu_item.destroy
    redirect_to menus_path
  end

  def update
    menu_id = params[:id]
    array = params[:menuitem_name].split("/")
    menuitem_name = array[0]
    category = array[1]
    menuitem = Menuitem.find_by("menu_id = ? and name = ? and category_name = ? ", menu_id, menuitem_name, category)
    name = (params[:Name] == "") ? menuitem.name : params[:Name]
    price = (params[:price] == "") ? menuitem.price : params[:price]
    description = (params[:description] == "") ? menuitem.description : params[:description]
    img_addr = (params[:img_addr] == "") ? menuitem.imgaddr : params[:img_addr]
    menuitem.price = price
    menuitem.description = description
    menuitem.imgaddr = img_addr
    menuitem.name = name
    menuitem.save!
    redirect_to menus_path
  end
end
