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

local Feature = java_lazy("org.allbinary.game.configuration.feature.Feature")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.MainFeatureFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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
            self:read()
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
        self:setFullscreen(true)
        self:setProgressBarView(false)
        self:setShowTitleBar(false)
        self.logUtil:putF("Read Configuration: " .. tostring(self), self, "read")
end


-- throws Exception
function ApplicationConfiguration:write()
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

