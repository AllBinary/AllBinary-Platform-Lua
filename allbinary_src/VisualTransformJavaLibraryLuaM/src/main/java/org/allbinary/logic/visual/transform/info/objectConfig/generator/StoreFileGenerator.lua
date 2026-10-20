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
-- package org.allbinary.logic.visual.transform.info.objectConfig.generator

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local InputStream = require("java.io.InputStream")
-- local HashMap = require("java.util.HashMap")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StdUtil = require("org.allbinary.logic.StdUtil")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local InputOutputTypeData = require("org.allbinary.logic.io.InputOutputTypeData")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileUtil = require("org.allbinary.logic.io.file.FileUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoHttpStoreInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfosData = require("org.allbinary.logic.visual.transform.info.TransformInfosData")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TransformInfoObjectConfigGenerator = require("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGenerator")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFileGenerator = {}
StoreFileGenerator.__index = StoreFileGenerator
StoreFileGenerator.className = "StoreFileGenerator"
setmetatable(StoreFileGenerator, {__index = TransformInfoObjectConfigGenerator})

function StoreFileGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.output = nil
    self.fileAbPath = nil
    self.file = nil
end


function StoreFileGenerator.new(transformInfoInterface)
    local self = setmetatable(TransformInfoObjectConfigGenerator.new(), StoreFileGenerator)
    self:_init_fields()
        local httpTransformInfoInterface = transformInfoInterface
        local weblisketSession = WeblisketSession.new(httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.URLGLOBALS:getWebappPath())
        stringBuffer:append(weblisketSession:getStoreName())
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        local abPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
        local fileName = httpTransformInfoInterface:getPropertiesHashMap():get(InputOutputTypeData.getInstance().FILE)
        local stringValidationUtil = StringValidationUtil.getInstance()
        if stringValidationUtil:isEmpty(fileName) then
            local transformInfoHttpStoreInterface = transformInfoInterface
            fileName = transformInfoInterface:getName():substring(transformInfoHttpStoreInterface:getStoreName():length() + 1)
            local outputMappingHashMap = StdUtil.getInstance():createHashMap()
            outputMappingHashMap:put(TransformInfosData.getInstance().PREVIEW, "Preview")
            outputMappingHashMap:put(TransformInfosData.getInstance().SMALL_PREVIEW, "SmallPreview")
            outputMappingHashMap:put(CommonSeps.getInstance().SPACE, StringUtil.getInstance().EMPTY_STRING)
            local replace = Replace.new(outputMappingHashMap)
            fileName = replace:all(fileName)
        end
        if stringValidationUtil:isEmpty(fileName) then
            error(java_exception("Exception", "TransformInfoObjectConfigGenerator FileName Not Specified"), 0)
        end
        local tempOutput = httpTransformInfoInterface:getPropertiesHashMap():get(InputOutputTypeData.getInstance().NAME)
        if stringValidationUtil:isEmpty(tempOutput) then
            tempOutput = InputOutputTypeData.getInstance().DEFAULT
        end
        self.output = tempOutput
        if stringValidationUtil:isEmpty(self.output) then
            error(java_exception("Exception", "TransformInfoObjectConfigGenerator Output=extension Not Specified"), 0)
        end
        stringBuffer = StringMaker.new()
        stringBuffer:append(fileName)
        stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
        stringBuffer:append(self.output)
        abPath = AbPath.new(tostring(abPath), tostring(stringBuffer))
        self.fileAbPath = abPath
        self.file = AbFile.createAbFileFromAbPath(self.fileAbPath)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("File: " .. tostring(self.fileAbPath), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


-- throws Exception
function StoreFileGenerator:process(input)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Processing", self, self.commonStrings.PROCESS)
        end
        if not self.file:exists() then
            self.file:createNewFile()
        end
        if self.file:exists() then
            local inputStream = ByteArrayInputStream.new({string.byte(input, 1, -1)})
            FileUtil.getInstance():write(inputStream, self.file)
        else
            error(java_exception("Exception", "Could Not Create: " .. tostring(self.fileAbPath)), 0)
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Processed", self, self.commonStrings.PROCESS)
        end
        return StringUtil.getInstance().EMPTY_STRING
end

return StoreFileGenerator

