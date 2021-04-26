package egovframework.com.cmm;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;


public class CustomObjectMapper extends ObjectMapper
{
	private static final long serialVersionUID = 8484503128885099973L;
	
	public CustomObjectMapper()
	{
		super.getSerializerProvider().setNullValueSerializer(new NullSerializer());
	}
	
	private class NullSerializer extends JsonSerializer<Object>
	{
		@Override
		public void serialize(Object value, JsonGenerator jgen, SerializerProvider provider)
				throws IOException, JsonProcessingException
		{
			jgen.writeString("");
		}
	}
}
