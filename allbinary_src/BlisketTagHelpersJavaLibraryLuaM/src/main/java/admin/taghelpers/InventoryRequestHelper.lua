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
-- package admin.taghelpers

local InventoryRequestHelper = {}
package.loaded["admin.taghelpers.InventoryRequestHelper"] = InventoryRequestHelper

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local AbTagData = java_lazy("admin.tags.AbTagData")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local ItemInterface = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local TableMappingInterface = java_lazy("org.allbinary.data.tables.TableMappingInterface")
local InventoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local HelperTag = java_lazy("tags.HelperTag")
local InventoryItemView = java_lazy("views.admin.inventory.InventoryItemView")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ModifyTable = require("admin.taghelpers.ModifyTable")
local InventoryItemViewParentTagHelper = java_lazy("admin.taghelpers.InventoryItemViewParentTagHelper")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table InventoryRequestHelper is declared before the requires
InventoryRequestHelper.__index = InventoryRequestHelper
InventoryRequestHelper.className = "InventoryRequestHelper"
InventoryRequestHelper.javaClassName = "admin.taghelpers.InventoryRequestHelper"
setmetatable(InventoryRequestHelper, {__index = ModifyTable})

function InventoryRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    if self.itemInterface == nil then self.itemInterface = nil end
end


function InventoryRequestHelper._jinit(self, propertiesHashMap, pageContext)
    java_super_init(ModifyTable, self)
    InventoryRequestHelper._init_fields(self)
        local inventoryTag = propertiesHashMap:get(AbTagData.PARENT)
        local itemView = InventoryItemViewParentTagHelper.getInstance():getInventoryItemView(inventoryTag)
        self.itemInterface = itemView:getItemInterface()
    return self
end

function InventoryRequestHelper.new(...)
    local self = setmetatable({}, InventoryRequestHelper)
    InventoryRequestHelper._jinit(self, ...)
    return self
end


-- throws Exception
function InventoryRequestHelper:insert()
        local try_ok, try_error, try_value = pcall(function()
            local dataMappingInterface = self:getItemInterface()
            local values = dataMappingInterface:toVector()
            InventoryEntityFactory.getInstance():getInventoryEntityInstance():insert(values)
            local success = "Successfully Added Product"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to add item to Inventory"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(InventoryRequestHelper, "insert", 0)


function InventoryRequestHelper:delete()
        local try_ok, try_error, try_value = pcall(function()
            local dataMappingInterface = self:getItemInterface()
            local id = dataMappingInterface:getKey()
            InventoryEntityFactory.getInstance():getInventoryEntityInstance():deleteWhere(self.basicItemData.ID, id)
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Successfully Removed the item with ")
            stringBuffer:append(self.basicItemData.ID)
            stringBuffer:append("=")
            stringBuffer:append(id)
            stringBuffer:append(" from to the Inventory table")
            local success = tostring(stringBuffer)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, self.tagStrings.DO_START_TAG)
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to remove item with from Inventory"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.tagStrings.DO_START_TAG, e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(InventoryRequestHelper, "delete", 0)


function InventoryRequestHelper:update()
        local try_ok, try_error, try_value = pcall(function()
            self:delete()
            self:insert()
            local success = "Item Successfully Updated"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed To Update Item"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(InventoryRequestHelper, "update", 0)


function InventoryRequestHelper:getItemInterface()
        return self.itemInterface
end
java_overload(InventoryRequestHelper, "getItemInterface", 0)

return InventoryRequestHelper

