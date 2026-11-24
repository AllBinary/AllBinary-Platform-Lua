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
-- package org.allbinary.business.category.store.theme

local StoreThemeCategory = {}
package.loaded["org.allbinary.business.category.store.theme.StoreThemeCategory"] = StoreThemeCategory

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
local Category = require("org.allbinary.business.category.Category")
local CategoryInterface = java_lazy("org.allbinary.business.category.CategoryInterface")
local CategoryPropertiesFactoryInterface = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ThemeData = java_lazy("org.allbinary.logic.visual.theme.ThemeData")
local ThemeValidation = java_lazy("org.allbinary.logic.visual.theme.ThemeValidation")
local ThemesData = java_lazy("org.allbinary.logic.visual.theme.ThemesData")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local StoreThemeCategoryInterface = require("org.allbinary.business.category.store.theme.StoreThemeCategoryInterface")

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

-- class table StoreThemeCategory is declared before the requires
StoreThemeCategory.__index = StoreThemeCategory
StoreThemeCategory.className = "StoreThemeCategory"
StoreThemeCategory.javaClassName = "org.allbinary.business.category.store.theme.StoreThemeCategory"
setmetatable(StoreThemeCategory, {__index = Category})
StoreThemeCategory.java_implements = " StoreThemeCategoryInterface "
StoreThemeCategory.java_interfaces = function() return {StoreThemeCategoryInterface} end

function StoreThemeCategory:_init_fields()
    if self.transformInfoInterface == nil then self.transformInfoInterface = nil end
    if self.themeVector == nil then self.themeVector = nil end
end

function StoreThemeCategory._jinit(self, ...)
    local count = select("#", ...)
    if count == 3 then return StoreThemeCategory._new3(self, ...)
    elseif count == 4 then return StoreThemeCategory._new4(self, ...)
    elseif count == 5 then return StoreThemeCategory._new5(self, ...)
    end
    error("No constructor of StoreThemeCategory takes " .. count .. " arguments")
end

function StoreThemeCategory.new(...)
    local self = setmetatable({}, StoreThemeCategory)
    StoreThemeCategory._jinit(self, ...)
    return self
end

function StoreThemeCategory._new4(self, ...)
    local java_a1, java_a2, java_a3, java_a4 = ...
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) and (java_a2 == nil or java_is(java_a2, "CategoryInterface")) and (java_a3 == nil or java_is(java_a3, "CategoryInterface")) and (java_a4 == nil or java_is(java_a4, "CategoryPropertiesFactoryInterface")) then return StoreThemeCategory._new4_1(self, ...) end
    return StoreThemeCategory._new4_2(self, ...)
end


function StoreThemeCategory._new3(self, transformInfoInterface, categoryPropertiesFactoryInterface, level)
    java_super_init(Category, self, categoryPropertiesFactoryInterface, level)
    StoreThemeCategory._init_fields(self)
        -- super(...) made self above
        self.transformInfoInterface = transformInfoInterface
        self.themeVector = BasicArrayListD.new()
    return self
end


function StoreThemeCategory._new4_1(self, transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
    java_super_init(Category, self, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
    StoreThemeCategory._init_fields(self)
        -- super(...) made self above
        self.transformInfoInterface = transformInfoInterface
        self.themeVector = BasicArrayListD.new()
    return self
end


function StoreThemeCategory._new4_2(self, transformInfoInterface, node, categoryPropertiesFactoryInterface, level)
    java_super_init(Category, self, categoryPropertiesFactoryInterface, level)
    StoreThemeCategory._init_fields(self)
        -- super(...) made self above
        self.transformInfoInterface = transformInfoInterface
        self.themeVector = BasicArrayListD.new()
        self:addThemes(node)
    return self
end


function StoreThemeCategory._new5(self, transformInfoInterface, node, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
    java_super_init(Category, self, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface)
    StoreThemeCategory._init_fields(self)
        -- super(...) made self above
        self.transformInfoInterface = transformInfoInterface
        self.themeVector = BasicArrayListD.new()
        self:addThemes(node)
    return self
end


function StoreThemeCategory:getTransformInfoInterface()
        return self.transformInfoInterface
end
java_overload(StoreThemeCategory, "getTransformInfoInterface", 0)


-- throws Exception
function StoreThemeCategory:addThemes(node)
        local themesNode = DomSearchHelper.getNode(ThemesData.getInstance().NAME, node:getChildNodes())
        local nodeList = themesNode:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local themeNode = nodeList:item(index)
            if themeNode:getNodeName():compareTo(ThemeData.getInstance().NAME) == 0 then
                self.themeVector:add(ThemeValidation.new(self, themeNode))
            end
        end
end
java_overload(StoreThemeCategory, "addThemes", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Node")) end)


function StoreThemeCategory:addTheme(themeValidation)
        self.themeVector:add(themeValidation)
end
java_overload(StoreThemeCategory, "addTheme", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ThemeValidation")) end)


function StoreThemeCategory:getThemes()
        return self.themeVector
end
java_overload(StoreThemeCategory, "getThemes", 0)


-- throws Exception
function StoreThemeCategory:isValid()
        if not java_super(Category, "isValid", 0)(self) then
            return false
        end
        return true
end
java_overload(StoreThemeCategory, "isValid", 0)


-- throws Exception
function StoreThemeCategory:toHashMap()
        local categoryHashMap = java_super(Category, "toHashMap", 0)(self)
        categoryHashMap:put(ThemesData.getInstance().NAME, self.themeVector)
        return categoryHashMap
end
java_overload(StoreThemeCategory, "toHashMap", 0)


-- throws Exception
function StoreThemeCategory:toVector()
        local categoryVector = java_super(Category, "toVector", 0)(self)
        return categoryVector
end
java_overload(StoreThemeCategory, "toVector", 0)

return StoreThemeCategory

