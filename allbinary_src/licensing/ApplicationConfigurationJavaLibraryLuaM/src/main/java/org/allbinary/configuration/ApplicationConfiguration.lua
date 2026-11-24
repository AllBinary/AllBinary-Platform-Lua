-- Generated Code Do Not Modify
-- package org.allbinary.configuration

local ApplicationConfiguration = {}
package.loaded["org.allbinary.configuration.ApplicationConfiguration"] = ApplicationConfiguration

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

-- local Closeable = require("java.io.Closeable")
-- local InputStream = require("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
local Feature = java_lazy("org.allbinary.game.configuration.feature.Feature")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.MainFeatureFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbDataInputStream = java_lazy("org.allbinary.logic.io.AbDataInputStream")
local AbDataOutputStream = java_lazy("org.allbinary.logic.io.AbDataOutputStream")
local FileStreamFactory = java_lazy("org.allbinary.logic.io.FileStreamFactory")
local NullCloseable = java_lazy("org.allbinary.logic.io.NullCloseable")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local FileFactory = java_lazy("org.allbinary.logic.io.file.FileFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ApplicationConfiguration is declared before the requires
ApplicationConfiguration.__index = ApplicationConfiguration
ApplicationConfiguration.className = "ApplicationConfiguration"
ApplicationConfiguration.javaClassName = "org.allbinary.configuration.ApplicationConfiguration"

function ApplicationConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.fullscreen = true
    self.showTitleBar = false
    self.progressBarView = false
    self.FILE = "ReloadConfiguration.dat"
end


function ApplicationConfiguration.getInstance()
        if ApplicationConfiguration.instance_f == NullUtil.getInstance().NULL_OBJECT then
            ApplicationConfiguration.instance_f = ApplicationConfiguration.new()
        end
        return ApplicationConfiguration.instance_f
end


function ApplicationConfiguration._jinit(self)
    ApplicationConfiguration._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            if FileFactory.getInstance():isFile(self.FILE) then
                self:read()
            else
                self:write()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
    return self
end

function ApplicationConfiguration.new(...)
    local self = setmetatable({}, ApplicationConfiguration)
    ApplicationConfiguration._jinit(self, ...)
    return self
end


-- throws Exception
function ApplicationConfiguration:read()
        local fileInputStreamFactory = FileStreamFactory.getInstance()
        local fileInputStream = fileInputStreamFactory:getFileInputStreamInstance(StringUtil.getInstance().EMPTY_STRING, self.FILE)
        local dataInputStream = AbDataInputStream.new(fileInputStream)
        local fullScreen = dataInputStream:readInt()
        if fullScreen == 0 then
            self:setFullscreen(false)
        elseif fullScreen == 1 then
            self:setFullscreen(true)
        else
            error(require("java.lang.Exception").new("Invalid FullScreen ActivityConfiguration"), 0)
        end
        local progressBarView = dataInputStream:readInt()
        if progressBarView == 0 then
            self:setProgressBarView(false)
        elseif progressBarView == 1 then
            self:setProgressBarView(true)
        else
            error(require("java.lang.Exception").new("Invalid ProgressBarView ActivityConfiguration"), 0)
        end
        local showTitleBar = dataInputStream:readInt()
        if showTitleBar == 0 then
            self:setShowTitleBar(false)
        elseif showTitleBar == 1 then
            self:setShowTitleBar(true)
        else
            error(require("java.lang.Exception").new("Invalid ShowTitleBar ActivityConfiguration"), 0)
        end
        self.logUtil:putF("Read Configuration: " .. tostring(self), self, "read")
end


-- throws Exception
function ApplicationConfiguration:write()
        local closeable = NullCloseable.NULL_CLOSEABLE
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Write Configuration: " .. tostring(self), self, "write")
            local fileInputStreamFactory = FileStreamFactory.getInstance()
            local fileOutputStream = fileInputStreamFactory:getFileOutputStreamInstance(StringUtil.getInstance().EMPTY_STRING, self.FILE)
            local dataOutputStream = AbDataOutputStream.new(fileOutputStream)
            closeable = dataOutputStream
            if self:isFullscreen() then
                dataOutputStream:writeInt(1)
            else
                dataOutputStream:writeInt(0)
            end
            if self:isProgressBarView() then
                dataOutputStream:writeInt(1)
            else
                dataOutputStream:writeInt(0)
            end
            if self:isShowTitleBar() then
                dataOutputStream:writeInt(1)
            else
                dataOutputStream:writeInt(0)
            end
            dataOutputStream:flush()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        do -- finally
            StreamUtil.getInstance():close(closeable)
        end
end


-- throws Exception
function ApplicationConfiguration:update(gameFeature)
        if gameFeature == MainFeatureFactory.getInstance().FULL_SCREEN then
            local features = Features.getInstance()
            if features:isFeature(gameFeature) then
                if not self:isFullscreen() then
                    self:setFullscreen(true)
                    self:write()
                end
            else
                if self:isFullscreen() then
                    self:setFullscreen(false)
                    self:write()
                end
            end
        end
end


function ApplicationConfiguration:setFullscreen(fullscreen)
        self.fullscreen = fullscreen
end


function ApplicationConfiguration:isFullscreen()
        return self.fullscreen
end


function ApplicationConfiguration:setShowTitleBar(showTitleBar)
        self.showTitleBar = showTitleBar
end


function ApplicationConfiguration:isShowTitleBar()
        return self.showTitleBar
end


function ApplicationConfiguration:setProgressBarView(progressBarView)
        self.progressBarView = progressBarView
end


function ApplicationConfiguration:isProgressBarView()
        return self.progressBarView
end


function ApplicationConfiguration:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("isFullscreen: ")
        stringBuffer:appendboolean(self:isFullscreen())
        stringBuffer:append(" isProgressBarView: ")
        stringBuffer:appendboolean(self:isProgressBarView())
        stringBuffer:append(" isShowTitleBar: ")
        stringBuffer:appendboolean(self:isShowTitleBar())
        return tostring(stringBuffer)
end
ApplicationConfiguration.__tostring = function(self) return self:toString() end

ApplicationConfiguration.instance_f = NullUtil.getInstance().NULL_OBJECT

return ApplicationConfiguration

