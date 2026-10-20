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
-- package admin.taghelpers

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicUserRole = require("org.allbinary.business.user.role.BasicUserRole")
local UserRole = require("org.allbinary.business.user.role.UserRole")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local HttpFilePermissions = require("org.allbinary.logic.communication.http.file.upload.HttpFilePermissions")
local HttpRequestUtil = require("org.allbinary.logic.communication.http.request.HttpRequestUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AuthenticationHelperUtil = {}
AuthenticationHelperUtil.__index = AuthenticationHelperUtil
AuthenticationHelperUtil.className = "AuthenticationHelperUtil"

function AuthenticationHelperUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function AuthenticationHelperUtil.new()
    local self = setmetatable({}, AuthenticationHelperUtil)
    self:_init_fields()
    return self
end


function AuthenticationHelperUtil.getInstance()
        return AuthenticationHelperUtil.instance
end


-- throws Exception
function AuthenticationHelperUtil:isAuthorized(authenticationHelper, filePath)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
            self.logUtil:putF(tostring(CommonLabels.getInstance().START) .. filePath, self, "isAuthorized()")
        end
        local endIndex = HttpRequestUtil.getInstance():getLastSeparatorIndex(filePath)
        local fullPath = AbPath.new(tostring(self.URLGLOBALS:getWebappPath()) .. string.sub(filePath, (0) + 1, endIndex), StringUtil.getInstance().EMPTY_STRING)
        local downloadFilePermissions = HttpFilePermissions.new(fullPath)
        local userRoles = downloadFilePermissions:getUserRoles()
        local userRole = authenticationHelper:getRole()
        local basicUserRole = userRole:getBasicUserRole()
        if userRoles:contains(basicUserRole) then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Authorized", self, "isAuthorized()")
            end
            return true
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Not Authorized: " .. tostring(basicUserRole), self, "isAuthorized()")
            end
            return false
        end
end

AuthenticationHelperUtil.instance = AuthenticationHelperUtil.new()

return AuthenticationHelperUtil

