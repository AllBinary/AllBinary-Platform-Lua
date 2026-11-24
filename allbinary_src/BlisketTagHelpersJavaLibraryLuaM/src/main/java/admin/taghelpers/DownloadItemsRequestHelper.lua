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

local DownloadItemsRequestHelper = {}
package.loaded["admin.taghelpers.DownloadItemsRequestHelper"] = DownloadItemsRequestHelper

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
local DownloadableItem = java_lazy("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")
local DownloadItemsEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.downloads.DownloadItemsEntityFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local HelperTag = java_lazy("tags.HelperTag")
local DownloadableInventoryItemView = java_lazy("views.admin.inventory.download.DownloadableInventoryItemView")
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

-- class table DownloadItemsRequestHelper is declared before the requires
DownloadItemsRequestHelper.__index = DownloadItemsRequestHelper
DownloadItemsRequestHelper.className = "DownloadItemsRequestHelper"
DownloadItemsRequestHelper.javaClassName = "admin.taghelpers.DownloadItemsRequestHelper"
setmetatable(DownloadItemsRequestHelper, {__index = ModifyTable})

function DownloadItemsRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.downloadableItem == nil then self.downloadableItem = nil end
end


function DownloadItemsRequestHelper._jinit(self, hashMap, pageContext)
    java_super_init(ModifyTable, self)
    DownloadItemsRequestHelper._init_fields(self)
        local inventoryTag = hashMap:get(AbTagData.PARENT)
        local inventoryItemViewParentTagHelper = InventoryItemViewParentTagHelper.getInstance()
        local downloadableInventoryItemView = inventoryItemViewParentTagHelper:getDownloadableInventoryItemView(inventoryTag)
        self.downloadableItem = downloadableInventoryItemView:getDownloadableItem()
    return self
end

function DownloadItemsRequestHelper.new(...)
    local self = setmetatable({}, DownloadItemsRequestHelper)
    DownloadItemsRequestHelper._jinit(self, ...)
    return self
end


function DownloadItemsRequestHelper:insert()
        local try_ok, try_error, try_value = pcall(function()
            local vector = self.downloadableItem:toVector()
            DownloadItemsEntityFactory.getInstance():getDownloadItemsEntityInstance():insert(vector)
            local success = "Successfully inserted " .. tostring(self.downloadableItem:getId()) .. " into downloaditems table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to insert " .. tostring(self.downloadableItem:getId()) .. " into downloaditems table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "inserts()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(DownloadItemsRequestHelper, "insert", 0)


function DownloadItemsRequestHelper:delete()
        local try_ok, try_error, try_value = pcall(function()
            DownloadItemsEntityFactory.getInstance():getDownloadItemsEntityInstance():delete(self.downloadableItem:getId())
            local success = "Successfully deleted"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to delete"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(DownloadItemsRequestHelper, "delete", 0)


function DownloadItemsRequestHelper:update()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Update Successful"
            local values = self.downloadableItem:toHashMap()
            DownloadItemsEntityFactory.getInstance():getDownloadItemsEntityInstance():update(values)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(tostring(self.downloadableItem:getId() + CommonSeps.getInstance().SPACE) .. success, self, "update()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to update: " .. tostring(self.downloadableItem:getId())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(DownloadItemsRequestHelper, "update", 0)

return DownloadItemsRequestHelper

