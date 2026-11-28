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
-- package admin.tags

local BasketTag = {}
package.loaded["admin.tags.BasketTag"] = BasketTag

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

-- local Method = require("java.lang.reflect.Method")
local HashMap = java_lazy("java.util.HashMap")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local BasketHelperFactory = java_lazy("admin.taghelpers.BasketHelperFactory")
local BasketRequestHelperFactory = java_lazy("admin.taghelpers.BasketRequestHelperFactory")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local BasketData = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketData")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local AbResponseHandler = java_lazy("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local CustomTagSupport = require("tags.CustomTagSupport")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table BasketTag is declared before the requires
BasketTag.__index = BasketTag
BasketTag.className = "BasketTag"
BasketTag.javaClassName = "admin.tags.BasketTag"
setmetatable(BasketTag, {__index = CustomTagSupport})

function BasketTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.command == nil then self.command = nil end
    if self.storeName == nil then self.storeName = nil end
    if self.propertiesHashMap == nil then self.propertiesHashMap = nil end
end


function BasketTag._jinit(self)
    java_super_init(CustomTagSupport, self)
    BasketTag._init_fields(self)
    return self
end

function BasketTag.new(...)
    local self = setmetatable({}, BasketTag)
    BasketTag._jinit(self, ...)
    return self
end


function BasketTag:setCommand(command)
        self.command = command
end
java_overload(BasketTag, "setCommand", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function BasketTag:setStoreName(value)
        self.storeName = value
end
java_overload(BasketTag, "setStoreName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws LicensingException
function BasketTag:isBasketEmpty()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = BasketHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("isBasketEmpty", nil)
            local emptyBoolean = method:invoke(anyType, nil)
            do return "__jreturn", emptyBoolean end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasketTag, "isBasketEmpty", 0)


-- throws LicensingException
function BasketTag:addItemToBasket()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = BasketRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("addItemToBasket", nil)
            local emptyBoolean = method:invoke(anyType, nil)
            do return "__jreturn", emptyBoolean end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasketTag, "addItemToBasket", 0)


-- throws LicensingException
function BasketTag:removeItemFromBasket()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = BasketRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("removeItemFromBasket", nil)
            local emptyBoolean = method:invoke(anyType, nil)
            do return "__jreturn", emptyBoolean end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasketTag, "removeItemFromBasket", 0)


-- throws LicensingException
function BasketTag:adjustBasket()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = BasketRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("adjustBasket", nil)
            local emptyBoolean = method:invoke(anyType, nil)
            do return "__jreturn", emptyBoolean end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasketTag, "adjustBasket", 0)


-- throws JspTagException
function BasketTag:doStartTag()
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(self.command, nil) then
                self.propertiesHashMap = StdUtil.getInstance():createHashMap()
                self.propertiesHashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
                if rawequal(((self.command < BasketData.INSERT and -1) or (self.command > BasketData.INSERT and 1) or 0), 0) then
                    if not (self:addItemToBasket()) then
                        self.pageContext:getOut():println("Item is not currently being sold.<p/>")
                    end
                elseif rawequal(((self.command < BasketData.DELETE and -1) or (self.command > BasketData.DELETE and 1) or 0), 0) then
                    self:removeItemFromBasket()
                elseif rawequal(((self.command < BasketData.ADJUST and -1) or (self.command > BasketData.ADJUST and 1) or 0), 0) then
                    self:adjustBasket()
                elseif rawequal(((self.command < BasketData.ISEMPTY and -1) or (self.command > BasketData.ISEMPTY and 1) or 0), 0) then
                    if self:isBasketEmpty() then
                        do return "__jreturn", self.EVAL_BODY_INCLUDE end
                    else
                        do return "__jreturn", self.SKIP_BODY end
                    end
                end
            end
            do return "__jreturn", self.SKIP_BODY end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasketTag, "doStartTag", 0)

return BasketTag

