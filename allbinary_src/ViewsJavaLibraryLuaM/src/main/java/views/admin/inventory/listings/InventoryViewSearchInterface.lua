--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package views.admin.inventory.listings


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local InventoryViewSearchInterface = {}
InventoryViewSearchInterface.__index = InventoryViewSearchInterface
InventoryViewSearchInterface.className = "InventoryViewSearchInterface"


-- throws Exception
function InventoryViewSearchInterface:searchSingleStaticPage()
    error("abstract method searchSingleStaticPage")
end


-- throws Exception
function InventoryViewSearchInterface:searchSingleDynamicPage()
    error("abstract method searchSingleDynamicPage")
end


-- throws Exception
function InventoryViewSearchInterface:search()
    error("abstract method search")
end


-- throws Exception
function InventoryViewSearchInterface:getProduct(product)
    error("abstract method getProduct")
end

return InventoryViewSearchInterface

