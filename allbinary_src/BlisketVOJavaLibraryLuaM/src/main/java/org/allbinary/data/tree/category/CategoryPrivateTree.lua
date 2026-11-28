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
-- package org.allbinary.data.tree.category

local CategoryPrivateTree = {}
package.loaded["org.allbinary.data.tree.category.CategoryPrivateTree"] = CategoryPrivateTree

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

local CategoryComponent = java_lazy("org.allbinary.business.category.CategoryComponent")
local CategoryData = java_lazy("org.allbinary.business.category.CategoryData")
local CategoryFactoryInterface = java_lazy("org.allbinary.business.category.CategoryFactoryInterface")
local CategoryInterface = java_lazy("org.allbinary.business.category.CategoryInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CryptFileWriter = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileWriter")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table CategoryPrivateTree is declared before the requires
CategoryPrivateTree.__index = CategoryPrivateTree
CategoryPrivateTree.className = "CategoryPrivateTree"
CategoryPrivateTree.javaClassName = "org.allbinary.data.tree.category.CategoryPrivateTree"

function CategoryPrivateTree:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.categoryFactoryInterface == nil then self.categoryFactoryInterface = nil end
end


function CategoryPrivateTree._jinit(self, categoryFactoryInterface)
    CategoryPrivateTree._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, "CategoryPrivateTree(CategoryFactoryInterface categoryFactoryInterface)")
        end
        self.categoryFactoryInterface = categoryFactoryInterface
    return self
end

function CategoryPrivateTree.new(...)
    local self = setmetatable({}, CategoryPrivateTree)
    CategoryPrivateTree._jinit(self, ...)
    return self
end


-- throws Exception
function CategoryPrivateTree:save(categoryInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
            self.logUtil:putF(require("allbinary_java").to_string("Saving Category File: ") .. require("allbinary_java").to_string(categoryInterface:getFilePath()), self, "save()")
        end
        local document = CategoryComponent.new(categoryInterface):toXmlDoc()
        local cryptFileWriter = CryptFileWriter.new(CategoryData.getInstance().UNCRYPTED_EXTENSION, CategoryData.getInstance().ENCRYPTED_EXTENSION)
        cryptFileWriter:write(categoryInterface:getFilePath(), document)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
            self.logUtil:putF("end", self, "save()")
        end
end


-- throws Exception
function CategoryPrivateTree:delete(categoryInterface)
        if categoryInterface:isLeaf() then
            local categoryFile = AbFile.createAbFileFromAbPath(categoryInterface:getFilePath())
            if categoryFile:delete() then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                    self.logUtil:putF(require("allbinary_java").to_string("Removed: ") .. require("allbinary_java").to_string(categoryInterface:getFilePath()), self, "delete(CategoryInterface)")
                end
            end
        else
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF("Not a leaf unable to remove", self, "delete(CategoryInterface)")
            end
        end
end

return CategoryPrivateTree

