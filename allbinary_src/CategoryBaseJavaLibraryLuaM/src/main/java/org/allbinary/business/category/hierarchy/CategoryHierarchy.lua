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
-- package org.allbinary.business.category.hierarchy

local CategoryHierarchy = {}
package.loaded["org.allbinary.business.category.hierarchy.CategoryHierarchy"] = CategoryHierarchy

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
local CategoryData = java_lazy("org.allbinary.business.category.CategoryData")
local CategoryInterface = java_lazy("org.allbinary.business.category.CategoryInterface")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CategoryHierarchyInterface = require("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")

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

-- class table CategoryHierarchy is declared before the requires
CategoryHierarchy.__index = CategoryHierarchy
CategoryHierarchy.className = "CategoryHierarchy"
CategoryHierarchy.javaClassName = "org.allbinary.business.category.hierarchy.CategoryHierarchy"
CategoryHierarchy.java_implements = " CategoryHierarchyInterface "
CategoryHierarchy.java_interfaces = function() return {CategoryHierarchyInterface} end

function CategoryHierarchy:_init_fields()
    if self.rootCategoryInterface == nil then self.rootCategoryInterface = nil end
    if self.parentCategoryInterface == nil then self.parentCategoryInterface = nil end
    if self.level == nil then self.level = 0 end
end

function CategoryHierarchy._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return CategoryHierarchy._new2(self, ...)
    elseif count == 3 then return CategoryHierarchy._new3(self, ...)
    end
    error("No constructor of CategoryHierarchy takes " .. count .. " arguments")
end

function CategoryHierarchy.new(...)
    local self = setmetatable({}, CategoryHierarchy)
    CategoryHierarchy._jinit(self, ...)
    return self
end

function CategoryHierarchy._new3(self, ...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "CategoryInterface")) and (java_a2 == nil or java_is(java_a2, "CategoryInterface")) and math.type(java_a3) == "integer" then return CategoryHierarchy._new3_1(self, ...) end
    return CategoryHierarchy._new3_2(self, ...)
end


function CategoryHierarchy._new2(self, rootCategoryInterface, parentCategoryInterface)
    CategoryHierarchy._init_fields(self)
        self.level = 0
        self:setRoot(rootCategoryInterface)
        self:setParent(parentCategoryInterface)
    return self
end


function CategoryHierarchy._new3_1(self, rootCategoryInterface, parentCategoryInterface, level)
    CategoryHierarchy._init_fields(self)
        self.level = level
        self:setRoot(rootCategoryInterface)
        self:setParent(parentCategoryInterface)
    return self
end


function CategoryHierarchy._new3_2(self, rootCategoryInterface, parentCategoryInterface, categoryPropertiesHashMap)
    CategoryHierarchy._init_fields(self)
        local levelString = StringUtil.getInstance():getNonNull(categoryPropertiesHashMap:get(CategoryData.getInstance().LEVEL))
        self.level = math.tointeger(tostring(levelString) // 1)
        self:setRoot(rootCategoryInterface)
        self:setParent(parentCategoryInterface)
    return self
end


function CategoryHierarchy:getLevel()
        return self.level
end


function CategoryHierarchy:getLevelString()
        return tostring(self.level)
end


function CategoryHierarchy:setLevel(level)
        self.level = level
end


function CategoryHierarchy:setParent(categoryInterface)
        self.parentCategoryInterface = categoryInterface
end


function CategoryHierarchy:setRoot(categoryInterface)
        self.rootCategoryInterface = categoryInterface
end


function CategoryHierarchy:getRoot()
        return self.rootCategoryInterface
end


function CategoryHierarchy:getParent()
        return self.parentCategoryInterface
end

return CategoryHierarchy

