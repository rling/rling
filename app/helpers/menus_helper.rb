module MenusHelper

  def get_menu_tree
    menu = Array.new
    Menuset.all.each do |menuset|
    top_items = Menu.find_all_by_menuset_id_and_level(menuset.id,1,:order => 'position')
    menu << menuset
    top_items.each { |item| add_child_item_to_menu(item, menu)}
    end
    return menu
  end

    def add_child_item_to_menu(item, menu)
      menu << item
      item.children.each { |child| add_child_item_to_menu(child, menu) }
    end
  
end
