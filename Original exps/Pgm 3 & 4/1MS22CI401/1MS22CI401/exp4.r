inventory_items<-character(0)
inventory_quantities<-numeric(0)
print(class(inventory_items))

add_item<-function(item,quantity){
  
  inventory_items<<-c(inventory_items,item)
  inventory_quantities<<-c(inventory_quantities,quantity)
  cat("item added to inventory.\n")
}
update_quantity<-function(item,new_quantity){
  if(item %n% inventory_items){
    
    item_index<-which(inventory_items==item)
    
    inventory_quantities[item_index]<<-new_quantity
    
    cat("Quantity updated.\n")
  }else{
    cat("Item not found in invemtory.\n")
  }
}

display_inventory<-function(){
  cat("Inventory Items and quantities:\n")
  
  for(i in 1:length(inventory_items)){
    cat(sprintf("%s:%d\n",inventory_items[i],inventory_quantities[i]))
  }
}

remove_item<-function(item){
  if(item %in% inventory_items){
    
    item_index<-which(inventory_items==item)
    
    inventory_items<<-inventory_items[inventory_items!=item]
    inventory_quantities<<-inventory_quantities[-c(item_index)]
    cat("Item removed.\n")
  }else{
    cat("item not found in inventory.\n")
  }
  cat("item added to inventory.\n")
}

while(TRUE){
  cat("\n1.Add Item\n2.Update Quantity\n3.Display Inventory\n4.Exit\n5.remove\n")
  choice<-as.integer(readline("Enter your choice:"))
  
  if(choice==1){
    
    item<-readline("Enter item name:")
    quantity<-as.integer(readline("Enter quantity:"))
    add_item(item,quantity)
    
  }else   if(choice==2){
    
    item<-readline("Enter item name:")
    new_quantity<-as.integer(readline("Enter new quantity:"))
    update_quantity(item,new_quantity)
  }else if(choice==3){
  display_inventory()
  }else if(choice==4){
    
    cat("Exiting the program.Goodbye!\n")
    break
    
  } else if(choice==5){
  
    item<-readline("Enter item name:")
    remove_item(item)
  
  }else{
  cat("Invalid choice.Please try again.\n")
  }
}

