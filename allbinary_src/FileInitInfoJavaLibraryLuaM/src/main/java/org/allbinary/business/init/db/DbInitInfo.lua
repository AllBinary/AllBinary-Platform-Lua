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
-- package org.allbinary.business.init.db

local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local HttpData = require("org.allbinary.logic.communication.http.HttpData")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbDataInputStream = require("org.allbinary.logic.io.AbDataInputStream")
local AbDataOutputStream = require("org.allbinary.logic.io.AbDataOutputStream")
local AbFileInputStream = require("org.allbinary.logic.io.AbFileInputStream")
local DataOutputStreamFactory = require("org.allbinary.logic.io.DataOutputStreamFactory")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local DatabaseEncoder = require("org.allbinary.logic.system.security.crypt.DatabaseEncoder")
local WeakCrypt = require("org.allbinary.logic.system.security.crypt.WeakCrypt")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DbInitInfo = {}
DbInitInfo.__index = DbInitInfo
DbInitInfo.className = "DbInitInfo"
setmetatable(DbInitInfo, {__index = DbConnectionInfo})

function DbInitInfo:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.directory = Directory.getInstance()
    self.httpData = HttpData.getInstance()
    self.GET_URL = "getUrl"
    self.PACKAGE = self.FREEBLISKET_PATH_GLOBALS:getInstance().DBINITPATH
    self.initFileName = nil
    self.hasRead = false
end


function DbInitInfo.new(initFileName, read)
    local self = setmetatable(DbConnectionInfo.new(), DbInitInfo)
    self:_init_fields()
        -- super(...) made self above
        self.initFileName = initFileName
        if read then
            self:updateIfNeeded()
        else
            self:setHasRead(true)
        end
    return self
end


function DbInitInfo:getUrl()
        local url = DbConnectionInfo.getUrl(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
            PreLogUtil.put(tostring(self.httpData.URL_LABEL) .. url, self, self.GET_URL)
        end
        return url
end


-- throws Exception
function DbInitInfo:write()
        local PATH = AbPath.new(tostring(self.URLGLOBALS:getWebappPath()) .. self.PACKAGE, StringUtil.getInstance().EMPTY_STRING)
        self.directory:create(PATH)
        local FILEABPATH = AbPath.new(tostring(self.URLGLOBALS:getWebappPath()) .. self.PACKAGE, self.initFileName)
        local try_ok, try_error = pcall(function()
            local newFile = AbFile.createAbFileFromAbPath(FILEABPATH)
            newFile:createNewFile()
            local dataOutputStream = DataOutputStreamFactory.getInstance():getInstanceForAbFile(newFile)
            local try_ok, try_error = pcall(function()
                local cryptedJdbcDriver = WeakCrypt.new(1):encrypt(self:getJdbcDriver()):getBytes()
                local cryptedName = WeakCrypt.new(2):encrypt(self:getName()):getBytes()
                local cryptedUserName = WeakCrypt.new(3):encrypt(self:getUserName()):getBytes()
                local cryptedPassword = WeakCrypt.new(4):encrypt(self:getPassword()):getBytes()
                local cryptedSchema = WeakCrypt.new(5):encrypt(self:getSchema()):getBytes()
                local cryptedServer = WeakCrypt.new(6):encrypt(self:getServer()):getBytes()
                local cryptedPort = WeakCrypt.new(7):encrypt(self:getPort()):getBytes()
                dataOutputStream:writeUTF(DatabaseEncoder.encode(cryptedJdbcDriver))
                dataOutputStream:writeUTF(DatabaseEncoder.encode(cryptedName))
                dataOutputStream:writeUTF(DatabaseEncoder.encode(cryptedUserName))
                dataOutputStream:writeUTF(DatabaseEncoder.encode(cryptedPassword))
                dataOutputStream:writeUTF(DatabaseEncoder.encode(cryptedSchema))
                dataOutputStream:writeUTF(DatabaseEncoder.encode(cryptedServer))
                dataOutputStream:writeUTF(DatabaseEncoder.encode(cryptedPort))
                self.hasRead = false
            end)
            do -- finally
                StreamUtil.getInstance():close(dataOutputStream)
            end
            if not try_ok then error(try_error, 0) end
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("Failed Write: " .. tostring(FILEABPATH), self, "write", e)
            end
        end
end


-- throws Exception
function DbInitInfo:load()
        local FILEABPATH = AbPath.new(tostring(self.URLGLOBALS:getWebappPath()) .. self.PACKAGE, self.initFileName)
        local try_ok, try_error = pcall(function()
            local file = AbFile.createAbFileFromAbPath(FILEABPATH)
            if file:isFile() then
                local iFile = AbFileInputStream.new(file)
                local iData = AbDataInputStream.new(iFile)
                local try_ok, try_error = pcall(function()
                    local decryptedJdbcDriver = tostring(DatabaseEncoder.decode(iData:readUTF()))
                    local decryptedName = tostring(DatabaseEncoder.decode(iData:readUTF()))
                    local decryptedUserName = tostring(DatabaseEncoder.decode(iData:readUTF()))
                    local decryptedPassword = tostring(DatabaseEncoder.decode(iData:readUTF()))
                    local decryptedSchema = tostring(DatabaseEncoder.decode(iData:readUTF()))
                    local decryptedServer = tostring(DatabaseEncoder.decode(iData:readUTF()))
                    local decryptedPort = tostring(DatabaseEncoder.decode(iData:readUTF()))
                    self:setJdbcDriver(WeakCrypt.new(1):decrypt(decryptedJdbcDriver))
                    self:setName(WeakCrypt.new(2):decrypt(decryptedName))
                    self:setUserName(WeakCrypt.new(3):decrypt(decryptedUserName))
                    self:setPassword(WeakCrypt.new(4):decrypt(decryptedPassword))
                    self:setSchema(WeakCrypt.new(5):decrypt(decryptedSchema))
                    self:setServer(WeakCrypt.new(6):decrypt(decryptedServer))
                    self:setPort(WeakCrypt.new(7):decrypt(decryptedPort))
                    local stringUtil = StringUtil.getInstance()
                end)
                do -- finally
                    StreamUtil.getInstance():close(iData)
                end
                if not try_ok then error(try_error, 0) end
            else
                self.hasRead = false
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
                    PreLogUtil.put("Not a File - Failed Loading: " .. tostring(FILEABPATH), self, self.commonStrings.LOAD)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE("Failed Loading: " .. tostring(FILEABPATH), self, self.commonStrings.LOAD, e)
            end
        end
end


function DbInitInfo:setHasRead(value)
        self.hasRead = value
end


function DbInitInfo:updateIfNeeded()
        local try_ok, try_error = pcall(function()
            if not self.hasRead then
                self.hasRead = true
                self:load()
            end
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, "updateIfNeeded", e)
            end
        end
end


function DbInitInfo:getName()
        self:updateIfNeeded()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
            PreLogUtil.put("Name: " .. DbConnectionInfo.getName(self), self, "getName")
        end
        return DbConnectionInfo.getName(self)
end


function DbInitInfo:getUserName()
        self:updateIfNeeded()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
            PreLogUtil.put("Name: " .. tostring(DbConnectionInfo.getUserName(self)), self, "getUserName")
        end
        return DbConnectionInfo.getUserName(self)
end


function DbInitInfo:getPassword()
        self:updateIfNeeded()
        return DbConnectionInfo.getPassword(self)
end


function DbInitInfo:getSchema()
        self:updateIfNeeded()
        return DbConnectionInfo.getSchema(self)
end


function DbInitInfo:getServer()
        self:updateIfNeeded()
        return DbConnectionInfo.getServer(self)
end


function DbInitInfo:getPort()
        self:updateIfNeeded()
        return DbConnectionInfo.getPort(self)
end

return DbInitInfo

