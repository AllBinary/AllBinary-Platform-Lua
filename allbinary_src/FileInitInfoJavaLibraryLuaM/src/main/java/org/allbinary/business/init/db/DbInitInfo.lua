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

local DbInitInfo = {}
package.loaded["org.allbinary.business.init.db.DbInitInfo"] = DbInitInfo

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

local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local HttpData = java_lazy("org.allbinary.logic.communication.http.HttpData")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbDataInputStream = java_lazy("org.allbinary.logic.io.AbDataInputStream")
local AbDataOutputStream = java_lazy("org.allbinary.logic.io.AbDataOutputStream")
local AbFileInputStream = java_lazy("org.allbinary.logic.io.AbFileInputStream")
local DataOutputStreamFactory = java_lazy("org.allbinary.logic.io.DataOutputStreamFactory")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local Directory = java_lazy("org.allbinary.logic.io.file.directory.Directory")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local DatabaseEncoder = java_lazy("org.allbinary.logic.system.security.crypt.DatabaseEncoder")
local WeakCrypt = java_lazy("org.allbinary.logic.system.security.crypt.WeakCrypt")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local DbConnectionInfo = require("org.allbinary.business.init.db.DbConnectionInfo")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
end

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

-- class table DbInitInfo is declared before the requires
DbInitInfo.__index = DbInitInfo
DbInitInfo.className = "DbInitInfo"
DbInitInfo.javaClassName = "org.allbinary.business.init.db.DbInitInfo"
setmetatable(DbInitInfo, {__index = DbConnectionInfo})

function DbInitInfo:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.directory = Directory.getInstance()
    self.httpData = HttpData.getInstance()
    self.GET_URL = "getUrl"
    self.PACKAGE = FREEBLISKET_PATH_GLOBALS.getInstance().DBINITPATH
    if self.initFileName == nil then self.initFileName = nil end
    self.hasRead = false
end


function DbInitInfo._jinit(self, initFileName, read)
    java_super_init(DbConnectionInfo, self)
    DbInitInfo._init_fields(self)
        -- super(...) made self above
        self.initFileName = initFileName
        if read then
            self:updateIfNeeded()
        else
            self:setHasRead(true)
        end
    return self
end

function DbInitInfo.new(...)
    local self = setmetatable({}, DbInitInfo)
    DbInitInfo._jinit(self, ...)
    return self
end


function DbInitInfo:getUrl()
        local url = java_super(DbConnectionInfo, "getUrl", 0)(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
            PreLogUtil.put(require("allbinary_java").to_string(self.httpData.URL_LABEL) .. require("allbinary_java").to_string(url), self, self.GET_URL)
        end
        return url
end
java_overload(DbInitInfo, "getUrl", 0)


-- throws Exception
function DbInitInfo:write()
        local PATH = AbPath.new(require("allbinary_java").to_string(URLGLOBALS.getWebappPath()) .. require("allbinary_java").to_string(self.PACKAGE), StringUtil.getInstance().EMPTY_STRING)
        self.directory:create(PATH)
        local FILEABPATH = AbPath.new(require("allbinary_java").to_string(URLGLOBALS.getWebappPath()) .. require("allbinary_java").to_string(self.PACKAGE), self.initFileName)
        local try_ok, try_error, try_value = pcall(function()
            local newFile = AbFile.createAbFileFromAbPath(FILEABPATH)
            newFile:createNewFile()
            local dataOutputStream = DataOutputStreamFactory.getInstance():getInstanceForAbFile(newFile)
            local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE(require("allbinary_java").to_string("Failed Write: ") .. require("allbinary_java").to_string(tostring(FILEABPATH)), self, "write", e)
            end
        end
end
java_overload(DbInitInfo, "write", 0)


-- throws Exception
function DbInitInfo:load()
        local FILEABPATH = AbPath.new(require("allbinary_java").to_string(URLGLOBALS.getWebappPath()) .. require("allbinary_java").to_string(self.PACKAGE), self.initFileName)
        local try_ok, try_error, try_value = pcall(function()
            local file = AbFile.createAbFileFromAbPath(FILEABPATH)
            if file:isFile() then
                local iFile = AbFileInputStream.createFromAbFile(file)
                local iData = AbDataInputStream.new(iFile)
                local try_ok, try_error, try_value = pcall(function()
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
                    PreLogUtil.put(require("allbinary_java").to_string("Not a File - Failed Loading: ") .. require("allbinary_java").to_string(tostring(FILEABPATH)), self, self.commonStrings.LOAD)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE(require("allbinary_java").to_string("Failed Loading: ") .. require("allbinary_java").to_string(tostring(FILEABPATH)), self, self.commonStrings.LOAD, e)
            end
        end
end
java_overload(DbInitInfo, "load", 0)


function DbInitInfo:setHasRead(value)
        self.hasRead = value
end
java_overload(DbInitInfo, "setHasRead", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function DbInitInfo:updateIfNeeded()
        local try_ok, try_error, try_value = pcall(function()
            if not (self.hasRead) then
                self.hasRead = true
                self:load()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, "updateIfNeeded", e)
            end
        end
end
java_overload(DbInitInfo, "updateIfNeeded", 0)


function DbInitInfo:getName()
        self:updateIfNeeded()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
            PreLogUtil.put(require("allbinary_java").to_string("Name: ") .. require("allbinary_java").to_string(java_super(DbConnectionInfo, "getName", 0)(self)), self, "getName")
        end
        return java_super(DbConnectionInfo, "getName", 0)(self)
end
java_overload(DbInitInfo, "getName", 0)


function DbInitInfo:getUserName()
        self:updateIfNeeded()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADER) then
            PreLogUtil.put(require("allbinary_java").to_string("Name: ") .. require("allbinary_java").to_string(java_super(DbConnectionInfo, "getUserName", 0)(self)), self, "getUserName")
        end
        return java_super(DbConnectionInfo, "getUserName", 0)(self)
end
java_overload(DbInitInfo, "getUserName", 0)


function DbInitInfo:getPassword()
        self:updateIfNeeded()
        return java_super(DbConnectionInfo, "getPassword", 0)(self)
end
java_overload(DbInitInfo, "getPassword", 0)


function DbInitInfo:getSchema()
        self:updateIfNeeded()
        return java_super(DbConnectionInfo, "getSchema", 0)(self)
end
java_overload(DbInitInfo, "getSchema", 0)


function DbInitInfo:getServer()
        self:updateIfNeeded()
        return java_super(DbConnectionInfo, "getServer", 0)(self)
end
java_overload(DbInitInfo, "getServer", 0)


function DbInitInfo:getPort()
        self:updateIfNeeded()
        return java_super(DbConnectionInfo, "getPort", 0)(self)
end
java_overload(DbInitInfo, "getPort", 0)

return DbInitInfo

