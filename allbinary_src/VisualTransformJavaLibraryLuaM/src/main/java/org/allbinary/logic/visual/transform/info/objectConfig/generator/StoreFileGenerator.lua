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

local StoreFileGenerator = {}
package.loaded["org.allbinary.logic.visual.transform.info.objectConfig.generator.StoreFileGenerator"] = StoreFileGenerator

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

local ByteArrayInputStream = java_lazy("java.io.ByteArrayInputStream")
local InputStream = java_lazy("java.io.InputStream")
local HashMap = java_lazy("java.util.HashMap")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local InputOutputTypeData = java_lazy("org.allbinary.logic.io.InputOutputTypeData")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FileUtil = java_lazy("org.allbinary.logic.io.file.FileUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")
local TransformInfoHttpInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoHttpStoreInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfosData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfosData")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table StoreFileGenerator is declared before the requires
StoreFileGenerator.__index = StoreFileGenerator
StoreFileGenerator.className = "StoreFileGenerator"
StoreFileGenerator.javaClassName = "org.allbinary.logic.visual.transform.info.objectConfig.generator.StoreFileGenerator"
setmetatable(StoreFileGenerator, {__index = TransformInfoObjectConfigGenerator})

function StoreFileGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.output == nil then self.output = nil end
    if self.fileAbPath == nil then self.fileAbPath = nil end
    if self.file == nil then self.file = nil end
end


function StoreFileGenerator._jinit(self, transformInfoInterface)
    java_super_init(TransformInfoObjectConfigGenerator, self)
    StoreFileGenerator._init_fields(self)
        local httpTransformInfoInterface = transformInfoInterface
        local weblisketSession = WeblisketSession.new(httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
        local stringBuffer = StringMaker.new()
        stringBuffer:append(URLGLOBALS.getWebappPath())
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
            error(require("java.lang.Exception").new("TransformInfoObjectConfigGenerator FileName Not Specified"), 0)
        end
        local tempOutput = httpTransformInfoInterface:getPropertiesHashMap():get(InputOutputTypeData.getInstance().NAME)
        if stringValidationUtil:isEmpty(tempOutput) then
            tempOutput = InputOutputTypeData.getInstance().DEFAULT
        end
        self.output = tempOutput
        if stringValidationUtil:isEmpty(self.output) then
            error(require("java.lang.Exception").new("TransformInfoObjectConfigGenerator Output=extension Not Specified"), 0)
        end
        stringBuffer = StringMaker.new()
        stringBuffer:append(fileName)
        stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
        stringBuffer:append(self.output)
        abPath = AbPath.new(tostring(abPath), tostring(stringBuffer))
        self.fileAbPath = abPath
        self.file = AbFile.createAbFileFromAbPath(self.fileAbPath)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("File: ") .. require("allbinary_java").to_string(tostring(self.fileAbPath)), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end

function StoreFileGenerator.new(...)
    local self = setmetatable({}, StoreFileGenerator)
    StoreFileGenerator._jinit(self, ...)
    return self
end


-- throws Exception
function StoreFileGenerator:process(input)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Processing", self, self.commonStrings.PROCESS)
        end
        if not (self.file:exists()) then
            self.file:createNewFile()
        end
        if self.file:exists() then
            local inputStream = ByteArrayInputStream.new({string.byte(input, 1, -1)})
            FileUtil.getInstance():write(inputStream, self.file)
        else
            error(require("java.lang.Exception").new(require("allbinary_java").to_string("Could Not Create: ") .. require("allbinary_java").to_string(tostring(self.fileAbPath))), 0)
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Processed", self, self.commonStrings.PROCESS)
        end
        return StringUtil.getInstance().EMPTY_STRING
end
java_overload(StoreFileGenerator, "process", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)

return StoreFileGenerator

