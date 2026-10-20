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
-- package org.allbinary.logic.communication.http.file.upload

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicUserRoleFactory = require("org.allbinary.business.user.role.BasicUserRoleFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HttpFilePermissions = {}
HttpFilePermissions.__index = HttpFilePermissions
HttpFilePermissions.className = "HttpFilePermissions"

function HttpFilePermissions:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.file = nil
    self.userRoles = BasicArrayListD.new()
end


function HttpFilePermissions.new(fullPath)
    local self = setmetatable({}, HttpFilePermissions)
    self:_init_fields()
        self.file = AbFile.createAbFileFromAbPath(AbPath.new(fullPath:toFileSystemString(), FileUploadData.getInstance().FILE))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
            self.logUtil:putF("Loading Privileges: " .. tostring(fullPath:toFileSystemString()), self, self.commonStrings.CONSTRUCTOR)
        end
        if self:isFile() then
            self.userRoles:add(BasicUserRoleFactory.getInstance().ADMINISTRATOR)
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
            self.logUtil:putF("User Roles: " .. tostring(self.userRoles), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function HttpFilePermissions:isFile()
        return self.file:isFile()
end


function HttpFilePermissions:getUserRoles()
        return self.userRoles
end

return HttpFilePermissions

