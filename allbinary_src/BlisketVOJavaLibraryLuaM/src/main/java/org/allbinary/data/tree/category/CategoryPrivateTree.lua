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

local CategoryComponent = require("org.allbinary.business.category.CategoryComponent")
local CategoryData = require("org.allbinary.business.category.CategoryData")
local CategoryFactoryInterface = require("org.allbinary.business.category.CategoryFactoryInterface")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CryptFileWriter = require("org.allbinary.logic.control.crypt.file.CryptFileWriter")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CategoryPrivateTree = {}
CategoryPrivateTree.__index = CategoryPrivateTree
CategoryPrivateTree.className = "CategoryPrivateTree"

function CategoryPrivateTree:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.categoryFactoryInterface = nil
end


function CategoryPrivateTree.new(categoryFactoryInterface)
    local self = setmetatable({}, CategoryPrivateTree)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, "CategoryPrivateTree(CategoryFactoryInterface categoryFactoryInterface)")
        end
        self.categoryFactoryInterface = categoryFactoryInterface
    return self
end


-- throws Exception
function CategoryPrivateTree:save(categoryInterface)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
            self.logUtil:putF("Saving Category File: " .. tostring(categoryInterface:getFilePath()), self, "save()")
        end
        local document = CategoryComponent.new(categoryInterface):toXmlDoc()
        local cryptFileWriter = CryptFileWriter.new(CategoryData.getInstance().UNCRYPTED_EXTENSION, CategoryData.getInstance().ENCRYPTED_EXTENSION)
        cryptFileWriter:write(categoryInterface:getFilePath(), document)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
            self.logUtil:putF("end", self, "save()")
        end
end


-- throws Exception
function CategoryPrivateTree:delete(categoryInterface)
        if categoryInterface:isLeaf() then
            local categoryFile = AbFile.createAbFileFromAbPath(categoryInterface:getFilePath())
            if categoryFile:delete() then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                    self.logUtil:putF("Removed: " .. tostring(categoryInterface:getFilePath()), self, "delete(CategoryInterface)")
                end
            end
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF("Not a leaf unable to remove", self, "delete(CategoryInterface)")
            end
        end
end

return CategoryPrivateTree

