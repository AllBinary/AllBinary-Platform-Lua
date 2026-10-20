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
-- package taghelpers.transform.info

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local ModifyTable = require("admin.taghelpers.ModifyTable")
local TransformInfoEntityBuilder = require("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoHttpStoreNoManipulation = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreNoManipulation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoRequestHelper = {}
TransformInfoRequestHelper.__index = TransformInfoRequestHelper
TransformInfoRequestHelper.className = "TransformInfoRequestHelper"
setmetatable(TransformInfoRequestHelper, {__index = ModifyTable})

function TransformInfoRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.transformInfoInterface = nil
end


function TransformInfoRequestHelper.new(propertiesHashMap, pageContext)
    local self = setmetatable(ModifyTable.new(), TransformInfoRequestHelper)
    self:_init_fields()
        self.transformInfoInterface = TransformInfoHttpStoreNoManipulation.new(propertiesHashMap, pageContext)
    return self
end


function TransformInfoRequestHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Updated Successfully"
            local hashMapData = self.transformInfoInterface:toHashMap()
            TransformInfoEntityBuilder.getInstance():update(hashMapData)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to update storefronts table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end


function TransformInfoRequestHelper:insert()
        local try_ok, try_error = pcall(function()
            local success = "Added TransformInfo Successfully"
            local values = self.transformInfoInterface:toVector()
            TransformInfoEntityBuilder.getInstance():insert(values)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "insert()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to add storefronts table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert()", e)
            end
            return error
        end
end


function TransformInfoRequestHelper:delete()
        local try_ok, try_error = pcall(function()
            local success = "Delete Successfully"
            TransformInfoEntityBuilder.getInstance():delete(self.transformInfoInterface:getKey())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to delete storefronts table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
            end
            return error
        end
end

return TransformInfoRequestHelper

