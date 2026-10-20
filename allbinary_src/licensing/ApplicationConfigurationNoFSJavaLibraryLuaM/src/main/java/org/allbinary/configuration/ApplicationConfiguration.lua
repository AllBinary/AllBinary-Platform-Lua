-- Generated Code Do Not Modify
-- package org.allbinary.configuration

local Feature = require("org.allbinary.game.configuration.feature.Feature")
local Features = require("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = require("org.allbinary.game.configuration.feature.MainFeatureFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local ApplicationConfiguration = {}
ApplicationConfiguration.__index = ApplicationConfiguration
ApplicationConfiguration.className = "ApplicationConfiguration"

function ApplicationConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.fullscreen = true
    self.showTitleBar = false
    self.progressBarView = false
end


function ApplicationConfiguration.getInstance()
        if ApplicationConfiguration.instance == NullUtil.getInstance().NULL_OBJECT then
            ApplicationConfiguration.instance = ApplicationConfiguration.new()
        end
        return ApplicationConfiguration.instance
end


function ApplicationConfiguration.new()
    local self = setmetatable({}, ApplicationConfiguration)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self:read()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
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

ApplicationConfiguration.instance = NullUtil.getInstance().NULL_OBJECT

return ApplicationConfiguration

