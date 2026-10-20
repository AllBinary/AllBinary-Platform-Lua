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
-- package views.admin.user

local UserRole = require("org.allbinary.business.user.role.UserRole")
local UserRoleB = require("org.allbinary.business.user.role.UserRoleB")
local UserRoleData = require("org.allbinary.business.user.role.UserRoleData")
local UserEntityFactory = require("org.allbinary.data.tables.user.UserEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local UsersView = require("views.admin.user.UsersView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UsersValidationView = {}
UsersValidationView.__index = UsersValidationView
UsersValidationView.className = "UsersValidationView"
setmetatable(UsersValidationView, {__index = UsersView})

function UsersValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function UsersValidationView.new(transformInfoInterface)
    local self = setmetatable(UsersView.new(transformInfoInterface), UsersValidationView)
    self:_init_fields()
        -- super(...) made self above
        local httpTransformInfoInterface = self:getTransformInfoInterface()
        local role = httpTransformInfoInterface:getPropertiesHashMap():get(tostring(UserRoleData.NAME))
        local userRole = UserRoleB.getRole(role)
        self.userVector = UserEntityFactory.getInstance():getUsersWithRole(userRole)
    return self
end


function UsersValidationView:isValid()
        local try_ok, try_error = pcall(function()
            if self.userVector:size() > 0 then
                return true
            else
                return false
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function UsersValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            return "No Users"
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
end


function UsersValidationView:toValidationInfoDoc()
        return nil
end


function UsersValidationView:toValidationInfoNode(document)
        return nil
end

return UsersValidationView

