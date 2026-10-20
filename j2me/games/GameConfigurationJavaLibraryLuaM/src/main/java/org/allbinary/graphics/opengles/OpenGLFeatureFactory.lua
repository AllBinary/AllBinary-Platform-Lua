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
-- package org.allbinary.graphics.opengles


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OpenGLFeatureFactory = {}
OpenGLFeatureFactory.__index = OpenGLFeatureFactory
OpenGLFeatureFactory.className = "OpenGLFeatureFactory"

function OpenGLFeatureFactory:_init_fields()
    self.OPENGL_OPTIONS = OpenGLFeature.new("OpenGL Options")
    self.OPENGL = OpenGLFeature.new("OpenGL")
    self.OPENGL_SURFACE_VIEW = OpenGLFeature.new("GLSurfaceView")
    self.OPENGL_2D = OpenGLFeature.new("OpenGL 2D")
    self.OPENGL_3D = OpenGLFeature.new("OpenGL 3D")
    self.OPENGL_2D_AND_3D = OpenGLFeature.new("OpenGL 2D/3D")
    self.OPENGL_AUTO_SELECT = OpenGLFeature.new("Auto Select")
    self.OPENGL_MINIMUM = OpenGLFeature.new("Minimum")
    self.OPENGL_AS_GAME_THREAD = OpenGLFeature.new("As game thread")
    self.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS = OpenGLFeature.new("As different threads")
    self.IMAGE_COLOR_DEPTH_4444 = OpenGLFeature.new("4444")
    self.IMAGE_COLOR_DEPTH_8888 = OpenGLFeature.new("8888")
    self.IMAGE_COLOR_DEPTH_565 = OpenGLFeature.new("565")
    self.OPENGL_COLOR_DEPTH_4444 = OpenGLFeature.new("4444")
    self.OPENGL_COLOR_DEPTH_8888 = OpenGLFeature.new("8888")
    self.OPENGL_COLOR_DEPTH_565 = OpenGLFeature.new("565")
    self.OPENGL_DRAW_TEXTURE = OpenGLFeature.new("GL_OES_draw_texture")
    self.OPENGL_VERTEX_BUFFER_OBJECT = OpenGLFeature.new("vertex_buffer_object")
    self.OPENGL_SIMPLE_OBJECT3D_PROCESSOR = OpenGLFeature.new("Simple Object3d Processor")
    self.OPENGL_COMPLEX_OBJECT3D_PROCESSOR = OpenGLFeature.new("Complex Object3d Processor")
    self.OPENGL_SIMPLE_TEXTURE_PROCESSOR = OpenGLFeature.new("Simple Texture Processor")
    self.OPENGL_COMPLEX_TEXTURE_PROCESSOR = OpenGLFeature.new("Complex Texture Processor")
end


function OpenGLFeatureFactory.getInstance()
        return OpenGLFeatureFactory.instance
end


function OpenGLFeatureFactory.new()
    local self = setmetatable({}, OpenGLFeatureFactory)
    self:_init_fields()
    return self
end

OpenGLFeatureFactory.instance = OpenGLFeatureFactory.new()

return OpenGLFeatureFactory

