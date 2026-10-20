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

local CategoryFactoryInterface = require("org.allbinary.business.category.CategoryFactoryInterface")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local CategoryPrivateTree = require("org.allbinary.data.tree.category.CategoryPrivateTree")
local CategoryModifierTreeInterface = require("org.allbinary.data.tree.category.CategoryModifierTreeInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CategoryModifierTree = {}
CategoryModifierTree.__index = CategoryModifierTree
CategoryModifierTree.className = "CategoryModifierTree"
setmetatable(CategoryModifierTree, {__index = CategoryPrivateTree})

function CategoryModifierTree:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.directory = Directory.getInstance()
end


function CategoryModifierTree.new(categoryFactoryInterface)
    local self = setmetatable(CategoryPrivateTree.new(categoryFactoryInterface), CategoryModifierTree)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
            self.logUtil:putF(self.commonStrings.START, self, "CategoryModifierTree(CategoryFactoryInterface categoryFactoryInterface)")
        end
    return self
end


function CategoryModifierTree:insert(parentCategoryInterface, newChildCategoryInterface)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                self.logUtil:putF("Inserting", self, "insert()")
            end
            if parentCategoryInterface:isValid() then
                parentCategoryInterface:addChild(newChildCategoryInterface)
                local directoryToBeCreatedAbPath = AbPath.new(tostring(newChildCategoryInterface:getRootFilePath()) .. tostring(newChildCategoryInterface:getPath()), StringUtil.getInstance().EMPTY_STRING)
                self.directory:create(directoryToBeCreatedAbPath)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
                    self.logUtil:putF("Saving", self, "insert()")
                end
                self:save(parentCategoryInterface)
                self:save(newChildCategoryInterface)
            else
                error(java_exception("Exception", "Will Not Add Null Category"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "insert", e)
            end
        end
end


function CategoryModifierTree:delete(parentCategoryInterface, existingChildCategoryInterface)
        local try_ok, try_error = pcall(function()
            if parentCategoryInterface:isValid() then
                parentCategoryInterface:addChild(existingChildCategoryInterface)
                local directoryToBeDeletedAbPath = AbPath.new(tostring(existingChildCategoryInterface:getRootFilePath()) .. tostring(existingChildCategoryInterface:getPath()), StringUtil.getInstance().EMPTY_STRING)
                self:delete(existingChildCategoryInterface)
                parentCategoryInterface:removeChild(existingChildCategoryInterface)
                self:save(parentCategoryInterface)
                self.directory:remove(directoryToBeDeletedAbPath)
            else
                error(java_exception("Exception", "Will Not Add Null Category"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.delete, e)
            end
        end
end

return CategoryModifierTree

