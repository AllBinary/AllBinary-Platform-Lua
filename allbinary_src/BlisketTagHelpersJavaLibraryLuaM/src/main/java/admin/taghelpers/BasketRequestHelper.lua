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

local BasketRequestHelper = {}
package.loaded["admin.taghelpers.BasketRequestHelper"] = BasketRequestHelper

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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFront = java_lazy("org.allbinary.business.context.modules.storefront.StoreFront")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasketData = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketData")
local BasketInterface = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local InventoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TagHelper = require("admin.taghelpers.TagHelper")

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

-- class table BasketRequestHelper is declared before the requires
BasketRequestHelper.__index = BasketRequestHelper
BasketRequestHelper.className = "BasketRequestHelper"
BasketRequestHelper.javaClassName = "admin.taghelpers.BasketRequestHelper"
setmetatable(BasketRequestHelper, {__index = TagHelper})

function BasketRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    if self.weblisketSession == nil then self.weblisketSession = nil end
    if self.storeFrontInterface == nil then self.storeFrontInterface = nil end
    if self.propertiesHashMap == nil then self.propertiesHashMap = nil end
    if self.pageContext == nil then self.pageContext = nil end
    if self.request == nil then self.request = nil end
    if self.id == nil then self.id = nil end
    if self.num == nil then self.num = nil end
    self.MAX = 200
end


function BasketRequestHelper._jinit(self, propertiesHashMap, pageContext)
    java_super_init(TagHelper, self)
    BasketRequestHelper._init_fields(self)
        self.propertiesHashMap = propertiesHashMap
        self.pageContext = pageContext
        self.request = pageContext:getRequest()
        local storeName = propertiesHashMap:get(StoreFrontData.getInstance().NAME)
        if storeName ~= nil then
            self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        else
            self.storeFrontInterface = StoreFront.new()
        end
        self.weblisketSession = WeblisketSession.new(propertiesHashMap, pageContext)
        self:getFormData()
    return self
end

function BasketRequestHelper.new(...)
    local self = setmetatable({}, BasketRequestHelper)
    BasketRequestHelper._jinit(self, ...)
    return self
end


function BasketRequestHelper:getFormData()
        self.id = self.request:getParameter(self.basicItemData.ID)
        self.num = self.request:getParameter(BasketData.ITEMTOTALINBASKET)
end
java_overload(BasketRequestHelper, "getFormData", 0)


function BasketRequestHelper:addItemToBasket()
        local try_ok, try_error, try_value = pcall(function()
            if self.id ~= nil and self.num ~= nil then
                local basket = self.weblisketSession:getOrder():getBasket()
                if InventoryEntityFactory.getInstance():getInventoryEntityInstance():getItem(self.id) == nil then
                    do return "__jreturn", false end
                end
                basket:addItem(self.id, self.num)
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF("Successfully added item to Basket", self, "addItemToBasket()")
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "addItemToBasket()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasketRequestHelper, "addItemToBasket", 0)


function BasketRequestHelper:removeItemFromBasket()
        local try_ok, try_error, try_value = pcall(function()
            if self.id ~= nil then
                local basket = self.weblisketSession:getOrder():getBasket()
                basket:removeItem(self.id)
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF("Successfully removed item from Basket", self, "removeItemFromBasket()")
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "removeItemFromBasket()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasketRequestHelper, "removeItemFromBasket", 0)


function BasketRequestHelper:adjustBasket()
        local try_ok, try_error, try_value = pcall(function()
            local basket = self.weblisketSession:getOrder():getBasket()
            if self.id ~= nil and self.num ~= nil then
                basket:adjustItem(self.id, self.num)
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF("Successfull Adjusted Basket", self, "adjustBasket()")
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "adjustBasket()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasketRequestHelper, "adjustBasket", 0)

return BasketRequestHelper

