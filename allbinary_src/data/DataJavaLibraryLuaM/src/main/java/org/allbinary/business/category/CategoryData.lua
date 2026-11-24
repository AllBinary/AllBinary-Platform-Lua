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
-- package org.allbinary.business.category

local CategoryData = {}
package.loaded["org.allbinary.business.category.CategoryData"] = CategoryData

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

local CommonDataFileStrings = java_lazy("org.allbinary.logic.io.file.CommonDataFileStrings")

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

-- class table CategoryData is declared before the requires
CategoryData.__index = CategoryData
CategoryData.className = "CategoryData"
CategoryData.javaClassName = "org.allbinary.business.category.CategoryData"

function CategoryData:_init_fields()
    self.PARENT = "CATEGORY_PARENT"
    self.NAME = "CATEGORY_NAME"
    self.PATH = "CATEGORY_PATH"
    self.LABEL = "CATEGORY_LABEL"
    self.VIEW = "CATEGORY_VIEW_CATEGORY"
    self.LEVEL = "CATEGORY_LEVEL"
    self.REQUEST = "request"
    self.ROOTCATEGORY = "Category"
    self.UNCRYPTED_EXTENSION = CommonDataFileStrings.getInstance().UNCRYPTED_EXTENSION
    self.ENCRYPTED_EXTENSION = CommonDataFileStrings.getInstance().ENCRYPTED_EXTENSION
end


function CategoryData.getInstance()
        return CategoryData.instance_f
end


function CategoryData._jinit(self)
    CategoryData._init_fields(self)
    return self
end

function CategoryData.new(...)
    local self = setmetatable({}, CategoryData)
    CategoryData._jinit(self, ...)
    return self
end

CategoryData.instance_f = CategoryData.new()

return CategoryData

