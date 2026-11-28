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

local InstallerInfo = {}
package.loaded["org.allbinary.business.init.InstallerInfo"] = InstallerInfo

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

local PATH_GLOBALS = java_lazy("org.allbinary.globals.PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbDataInputStream = java_lazy("org.allbinary.logic.io.AbDataInputStream")
local AbDataOutputStream = java_lazy("org.allbinary.logic.io.AbDataOutputStream")
local AbFileLocalInputStream = java_lazy("org.allbinary.logic.io.AbFileLocalInputStream")
local DataOutputStreamFactory = java_lazy("org.allbinary.logic.io.DataOutputStreamFactory")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local DatabaseEncoder = java_lazy("org.allbinary.logic.system.security.crypt.DatabaseEncoder")
local WeakCrypt = java_lazy("org.allbinary.logic.system.security.crypt.WeakCrypt")
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

-- class table InstallerInfo is declared before the requires
InstallerInfo.__index = InstallerInfo
InstallerInfo.className = "InstallerInfo"
InstallerInfo.javaClassName = "org.allbinary.business.init.InstallerInfo"

function InstallerInfo:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function InstallerInfo._jinit(self)
    InstallerInfo._init_fields(self)
    return self
end

function InstallerInfo.new(...)
    local self = setmetatable({}, InstallerInfo)
    InstallerInfo._jinit(self, ...)
    return self
end


-- throws Exception
function InstallerInfo:write()
        local FILEABPATH = AbPath.new(URLGLOBALS.getMainPath() + InstallerInfo.PACKAGE, InstallerInfo.INITFILENAME)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                self.logUtil:putF("Failed", self, "write")
            end
            error(e, 0)
        end
end


-- throws Exception
function InstallerInfo:read()
        local FILEABPATH = AbPath.new(URLGLOBALS.getMainPath() + InstallerInfo.PACKAGE, InstallerInfo.INITFILENAME)
        local try_ok, try_error, try_value = pcall(function()
            local file = AbFile.createAbFileFromAbPath(FILEABPATH)
            if file:isFile() then
                local iFile = AbFileLocalInputStream.new(file)
                local iData = AbDataInputStream.new(iFile)
                local decryptedUserName = tostring(DatabaseEncoder.decode(iData:readUTF()))
                local decryptedPassword = tostring(DatabaseEncoder.decode(iData:readUTF()))
                self:setUserName(WeakCrypt.new(1):decrypt(decryptedUserName))
                self:setPassword(WeakCrypt.new(2):decrypt(decryptedPassword))
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
                    self.logUtil:putF(require("allbinary_java").to_string("Not a File - Failed Loading: ") .. require("allbinary_java").to_string(tostring(FILEABPATH)), self, "read")
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
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
        if not (InstallerInfo.hasRead) then
            InstallerInfo.hasRead = true
            self:read()
            if rawequal(InstallerInfo.userName, nil) or rawequal(InstallerInfo.password, nil) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
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
        if not rawequal(InstallerInfo.userName, nil) and rawequal(((InstallerInfo.userName < userName and -1) or (InstallerInfo.userName > userName and 1) or 0), 0) and not rawequal(InstallerInfo.password, nil) and rawequal(((InstallerInfo.password < password and -1) or (InstallerInfo.password > password and 1) or 0), 0) then
            return true
        end
        return false
end

InstallerInfo.instance_f = InstallerInfo.new()
InstallerInfo.INITFILENAME = "installerdata.dat"
InstallerInfo.PACKAGE = PATH_GLOBALS.getInstance().INIT_PATH
InstallerInfo.userName = StringUtil.getInstance().EMPTY_STRING
InstallerInfo.password = StringUtil.getInstance().EMPTY_STRING
InstallerInfo.hasRead = false

return InstallerInfo

