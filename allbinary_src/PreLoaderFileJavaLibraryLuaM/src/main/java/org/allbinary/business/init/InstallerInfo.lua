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
-- package org.allbinary.business.init

local PATH_GLOBALS = require("org.allbinary.globals.PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbDataInputStream = require("org.allbinary.logic.io.AbDataInputStream")
local AbDataOutputStream = require("org.allbinary.logic.io.AbDataOutputStream")
local AbFileLocalInputStream = require("org.allbinary.logic.io.AbFileLocalInputStream")
local DataOutputStreamFactory = require("org.allbinary.logic.io.DataOutputStreamFactory")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local DatabaseEncoder = require("org.allbinary.logic.system.security.crypt.DatabaseEncoder")
local WeakCrypt = require("org.allbinary.logic.system.security.crypt.WeakCrypt")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InstallerInfo = {}
InstallerInfo.__index = InstallerInfo
InstallerInfo.className = "InstallerInfo"

function InstallerInfo:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function InstallerInfo.new()
    local self = setmetatable({}, InstallerInfo)
    self:_init_fields()
    return self
end


-- throws Exception
function InstallerInfo:write()
        local FILEABPATH = AbPath.new(self.URLGLOBALS:getMainPath() + InstallerInfo.PACKAGE, InstallerInfo.INITFILENAME)
        local try_ok, try_error = pcall(function()
            local newFile = AbFile.createAbFileFromAbPath(FILEABPATH)
            newFile:createNewFile()
            local dataOutputStream = DataOutputStreamFactory.getInstance():getInstanceForAbFile(newFile)
            local cryptedUserName = WeakCrypt.new(1):encrypt(self:getUserName()):getBytes()
            local cryptedPassword = WeakCrypt.new(2):encrypt(self:getPassword()):getBytes()
            dataOutputStream:writeUTF(DatabaseEncoder.encode(cryptedUserName))
            dataOutputStream:writeUTF(DatabaseEncoder.encode(cryptedPassword))
            InstallerInfo.hasRead = false
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRELOADERERROR) then
                self.logUtil:putF("Failed", self, "write")
            end
            error(e, 0)
        end
end


-- throws Exception
function InstallerInfo:read()
        local FILEABPATH = AbPath.new(self.URLGLOBALS:getMainPath() + InstallerInfo.PACKAGE, InstallerInfo.INITFILENAME)
        local try_ok, try_error = pcall(function()
            local file = AbFile.createAbFileFromAbPath(FILEABPATH)
            if file:isFile() then
                local iFile = AbFileLocalInputStream.new(file)
                local iData = AbDataInputStream.new(iFile)
                local decryptedUserName = tostring(DatabaseEncoder.decode(iData:readUTF()))
                local decryptedPassword = tostring(DatabaseEncoder.decode(iData:readUTF()))
                self:setUserName(WeakCrypt.new(1):decrypt(decryptedUserName))
                self:setPassword(WeakCrypt.new(2):decrypt(decryptedPassword))
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRELOADER) then
                    self.logUtil:putF("Not a File - Failed Loading: " .. tostring(FILEABPATH), self, "read")
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRELOADERERROR) then
                self.logUtil:putF("Failed", self, "read")
            end
        end
end


function InstallerInfo.setHasRead(value)
        InstallerInfo.hasRead = value
end


function InstallerInfo:setUserName(userName)
        InstallerInfo.userName = userName
end


function InstallerInfo:setPassword(password)
        InstallerInfo.password = password
end


-- throws Exception
function InstallerInfo:updateIfNeeded()
        if not InstallerInfo.hasRead then
            InstallerInfo.hasRead = true
            self:read()
            if InstallerInfo.userName == nil or InstallerInfo.password == nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRELOADER) then
                    self.logUtil:putF("Failed", self, "updateIfNeeded")
                end
            end
        end
end


-- throws Exception
function InstallerInfo:getUserName()
        self:updateIfNeeded()
        return InstallerInfo.userName
end


-- throws Exception
function InstallerInfo:getPassword()
        self:updateIfNeeded()
        return InstallerInfo.password
end


-- throws Exception
function InstallerInfo:isValid(userName, password)
        self:updateIfNeeded()
        if self.userName ~= nil and ((self.userName < userName and -1) or (self.userName > userName and 1) or 0) == 0 and self.password ~= nil and ((self.password < password and -1) or (self.password > password and 1) or 0) == 0 then
            return true
        end
        return false
end

InstallerInfo.instance = InstallerInfo.new()
InstallerInfo.INITFILENAME = "installerdata.dat"
InstallerInfo.PACKAGE = self.PATH_GLOBALS:getInstance().INIT_PATH
InstallerInfo.userName = StringUtil.getInstance().EMPTY_STRING
InstallerInfo.password = StringUtil.getInstance().EMPTY_STRING
InstallerInfo.hasRead = false

return InstallerInfo

