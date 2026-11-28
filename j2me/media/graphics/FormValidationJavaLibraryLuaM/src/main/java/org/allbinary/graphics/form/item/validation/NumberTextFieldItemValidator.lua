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
-- package org.allbinary.graphics.form.item.validation

local NumberTextFieldItemValidator = {}
package.loaded["org.allbinary.graphics.form.item.validation.NumberTextFieldItemValidator"] = NumberTextFieldItemValidator

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

local ABTextFieldItem = java_lazy("org.allbinary.graphics.form.item.ABTextFieldItem")
local ValidatorBase = require("org.allbinary.logic.control.validate.ValidatorBase")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table NumberTextFieldItemValidator is declared before the requires
NumberTextFieldItemValidator.__index = NumberTextFieldItemValidator
NumberTextFieldItemValidator.className = "NumberTextFieldItemValidator"
NumberTextFieldItemValidator.javaClassName = "org.allbinary.graphics.form.item.validation.NumberTextFieldItemValidator"
setmetatable(NumberTextFieldItemValidator, {__index = ValidatorBase})

function NumberTextFieldItemValidator:_init_fields()
    if self.textFieldItem == nil then self.textFieldItem = nil end
    if self.min == nil then self.min = 0 end
    if self.max == nil then self.max = 0 end
    if self.maxChars == nil then self.maxChars = 0 end
end


function NumberTextFieldItemValidator._jinit(self, textFieldItem, maxChars, min, max)
    java_super_init(ValidatorBase, self)
    NumberTextFieldItemValidator._init_fields(self)
        self.textFieldItem = textFieldItem
        self.min = min
        self.max = max
        self.maxChars = maxChars
    return self
end

function NumberTextFieldItemValidator.new(...)
    local self = setmetatable({}, NumberTextFieldItemValidator)
    NumberTextFieldItemValidator._jinit(self, ...)
    return self
end


function NumberTextFieldItemValidator:isNumberValid(value)
        return BooleanFactory.getInstance().TRUE
end
java_overload(NumberTextFieldItemValidator, "isNumberValid", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function NumberTextFieldItemValidator:toNumberVector(value)
        return BasicArrayListD.new()
end
java_overload(NumberTextFieldItemValidator, "toNumberVector", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function NumberTextFieldItemValidator:isValid()
        local result = BooleanFactory.getInstance().TRUE
        local string_ = self.textFieldItem:getString()
        local textLength = #string_
        if textLength > 0 and textLength < self.maxChars then
            local try_ok, try_error, try_value = pcall(function()
                math.tointeger(tonumber(self.textFieldItem:getString()))
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                result = BooleanFactory.getInstance().FALSE
            end
        else
            if textLength < 1 then
                result = BooleanFactory.getInstance().FALSE
            elseif textLength > self.maxChars then
                result = BooleanFactory.getInstance().FALSE
            end
        end
        return result
end
java_overload(NumberTextFieldItemValidator, "isValid", 0)


function NumberTextFieldItemValidator:toList()
        local list = BasicArrayListD.new()
        local string_ = self.textFieldItem:getString()
        local textLength = #string_
        local label = self.textFieldItem:getLabel()
        local name = string.sub(label, (0) + 1, #label - 2)
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local stringMaker = StringMaker.new()
        if textLength > 0 and textLength < self.maxChars then
            local try_ok, try_error, try_value = pcall(function()
                local number = smallIntegerSingletonFactory:createInstance(math.tointeger(tonumber(self.textFieldItem:getString())))
                if require("allbinary_java").number_value(number, "intValue") > self.min then
                    stringMaker:delete(0, stringMaker:length())
                    list:add(tostring(stringMaker:append(name):append(" is to small")))
                elseif require("allbinary_java").number_value(number, "intValue") > self.max then
                    stringMaker:delete(0, stringMaker:length())
                    list:add(tostring(stringMaker:append(name):append(" is to large")))
                end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                stringMaker:delete(0, stringMaker:length())
                list:add(tostring(stringMaker:append(name):append(" is not a number")))
            end
        else
            if textLength < 1 then
                stringMaker:delete(0, stringMaker:length())
                list:add(tostring(stringMaker:append(name):append(" is to short")))
            elseif textLength > self.maxChars then
                stringMaker:delete(0, stringMaker:length())
                list:add(tostring(stringMaker:append(name):append(" is to long")))
            end
        end
        return list
end
java_overload(NumberTextFieldItemValidator, "toList", 0)

return NumberTextFieldItemValidator

