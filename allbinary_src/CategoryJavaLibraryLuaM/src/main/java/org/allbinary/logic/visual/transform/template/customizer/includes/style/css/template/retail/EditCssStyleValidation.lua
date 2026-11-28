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
-- package org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail

local EditCssStyleValidation = {}
package.loaded["org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.EditCssStyleValidation"] = EditCssStyleValidation

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
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ValidationInterface = java_lazy("org.allbinary.logic.control.validate.ValidationInterface")
local StyleData = java_lazy("org.allbinary.logic.visual.dhtml.style.StyleData")
local StylesData = java_lazy("org.allbinary.logic.visual.dhtml.style.StylesData")
local ColorsView = java_lazy("org.allbinary.logic.visual.dhtml.style.color.ColorsView")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local CssStyleValidation = require("org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.CssStyleValidation")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table EditCssStyleValidation is declared before the requires
EditCssStyleValidation.__index = EditCssStyleValidation
EditCssStyleValidation.className = "EditCssStyleValidation"
EditCssStyleValidation.javaClassName = "org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.EditCssStyleValidation"
setmetatable(EditCssStyleValidation, {__index = CssStyleValidation})
EditCssStyleValidation.java_implements = " ValidationInterface DomNodeInterface "
EditCssStyleValidation.java_interfaces = function() return {ValidationInterface, DomNodeInterface} end

function EditCssStyleValidation._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return EditCssStyleValidation._new0(self, ...)
    elseif count == 1 then return EditCssStyleValidation._new1(self, ...)
    end
    error("No constructor of EditCssStyleValidation takes " .. count .. " arguments")
end

function EditCssStyleValidation.new(...)
    local self = setmetatable({}, EditCssStyleValidation)
    EditCssStyleValidation._jinit(self, ...)
    return self
end

function EditCssStyleValidation._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Document")) then return EditCssStyleValidation._new1_1(self, ...) end
    return EditCssStyleValidation._new1_2(self, ...)
end


function EditCssStyleValidation._new0(self)
    java_super_init(CssStyleValidation, self)
    return self
end


function EditCssStyleValidation._new1_1(self, document)
    java_super_init(CssStyleValidation, self, document)
        -- super(...) made self above
    return self
end


function EditCssStyleValidation._new1_2(self, hashMap)
    java_super_init(CssStyleValidation, self, hashMap)
        -- super(...) made self above
    return self
end


function EditCssStyleValidation:isValid()
        return java_super(CssStyleValidation, "isValid", 0)(self)
end
java_overload(EditCssStyleValidation, "isValid", 0)


function EditCssStyleValidation:validationInfo()
        return java_super(CssStyleValidation, "validationInfo", 0)(self)
end
java_overload(EditCssStyleValidation, "validationInfo", 0)


function EditCssStyleValidation:toValidationInfoDoc()
        return nil
end
java_overload(EditCssStyleValidation, "toValidationInfoDoc", 0)


function EditCssStyleValidation:toValidationInfoNode(document)
        return nil
end
java_overload(EditCssStyleValidation, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function EditCssStyleValidation:toXmlNode(document)
        local node = document:createElement(StylesData.getInstance().NAME)
        local styleNode = document:createElement(StyleData.getInstance().NAME)
        node:appendChild(styleNode)
        styleNode:appendChild(ColorsView.new():toXmlNode(document))
        local size = self.cssStyleElementVector:size()
        for i = 0, size - 1 do
            local styleDomNodeInterface = self.cssStyleElementVector:get(i)
            styleNode:appendChild(styleDomNodeInterface:toXmlNode(document))
        end
        return node
end
java_overload(EditCssStyleValidation, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)

return EditCssStyleValidation

