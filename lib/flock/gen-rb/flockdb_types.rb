#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#


module Flock
  module Edges
        module SelectOperationType
          SimpleQuery = 1
          Intersection = 2
          Union = 3
          Difference = 4
          VALUE_MAP = {1 => "SimpleQuery", 2 => "Intersection", 3 => "Union", 4 => "Difference"}
          VALID_VALUES = Set.new([SimpleQuery, Intersection, Union, Difference]).freeze
        end

        module ExecuteOperationType
          Add = 1
          Remove = 2
          Archive = 3
          Negate = 4
          VALUE_MAP = {1 => "Add", 2 => "Remove", 3 => "Archive", 4 => "Negate"}
          VALID_VALUES = Set.new([Add, Remove, Archive, Negate]).freeze
        end

        module EdgeState
          Positive = 0
          Negative = 3
          Removed = 1
          Archived = 2
          VALUE_MAP = {0 => "Positive", 3 => "Negative", 1 => "Removed", 2 => "Archived"}
          VALID_VALUES = Set.new([Positive, Negative, Removed, Archived]).freeze
        end

        module Priority
          Low = 1
          Medium = 2
          High = 3
          VALUE_MAP = {1 => "Low", 2 => "Medium", 3 => "High"}
          VALID_VALUES = Set.new([Low, Medium, High]).freeze
        end

        class FlockException < ::Thrift::Exception
          include ::Thrift::Struct
          def initialize(message=nil)
            super()
            self.description = message
          end

          def message; description end

          DESCRIPTION = 1

          ::Thrift::Struct.field_accessor self, :description
          FIELDS = {
            DESCRIPTION => {:type => ::Thrift::Types::STRING, :name => 'description'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

        end

        class Results
          include ::Thrift::Struct
          IDS = 1
          NEXT_CURSOR = 2
          PREV_CURSOR = 3

          ::Thrift::Struct.field_accessor self, :ids, :next_cursor, :prev_cursor
          FIELDS = {
            IDS => {:type => ::Thrift::Types::STRING, :name => 'ids'},
            NEXT_CURSOR => {:type => ::Thrift::Types::I64, :name => 'next_cursor'},
            PREV_CURSOR => {:type => ::Thrift::Types::I64, :name => 'prev_cursor'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

        end

        class Page
          include ::Thrift::Struct
          COUNT = 1
          CURSOR = 2

          ::Thrift::Struct.field_accessor self, :count, :cursor
          FIELDS = {
            COUNT => {:type => ::Thrift::Types::I32, :name => 'count'},
            CURSOR => {:type => ::Thrift::Types::I64, :name => 'cursor'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

        end

        class Edge
          include ::Thrift::Struct
          SOURCE_ID = 1
          DESTINATION_ID = 2
          POSITION = 3
          UPDATED_AT = 4
          COUNT = 5
          STATE_ID = 6

          ::Thrift::Struct.field_accessor self, :source_id, :destination_id, :position, :updated_at, :count, :state_id
          FIELDS = {
            SOURCE_ID => {:type => ::Thrift::Types::I64, :name => 'source_id'},
            DESTINATION_ID => {:type => ::Thrift::Types::I64, :name => 'destination_id'},
            POSITION => {:type => ::Thrift::Types::I64, :name => 'position'},
            UPDATED_AT => {:type => ::Thrift::Types::I32, :name => 'updated_at'},
            COUNT => {:type => ::Thrift::Types::I32, :name => 'count'},
            STATE_ID => {:type => ::Thrift::Types::I32, :name => 'state_id'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

        end

        class QueryTerm
          include ::Thrift::Struct
          SOURCE_ID = 1
          GRAPH_ID = 2
          IS_FORWARD = 3
          DESTINATION_IDS = 4
          STATE_IDS = 5

          ::Thrift::Struct.field_accessor self, :source_id, :graph_id, :is_forward, :destination_ids, :state_ids
          FIELDS = {
            SOURCE_ID => {:type => ::Thrift::Types::I64, :name => 'source_id'},
            GRAPH_ID => {:type => ::Thrift::Types::I32, :name => 'graph_id'},
            IS_FORWARD => {:type => ::Thrift::Types::BOOL, :name => 'is_forward'},
            DESTINATION_IDS => {:type => ::Thrift::Types::STRING, :name => 'destination_ids', :optional => true},
            STATE_IDS => {:type => ::Thrift::Types::LIST, :name => 'state_ids', :element => {:type => ::Thrift::Types::I32}, :optional => true}
          }

          def struct_fields; FIELDS; end

          def validate
          end

        end

        class SelectOperation
          include ::Thrift::Struct
          OPERATION_TYPE = 1
          TERM = 2

          ::Thrift::Struct.field_accessor self, :operation_type, :term
          FIELDS = {
            OPERATION_TYPE => {:type => ::Thrift::Types::I32, :name => 'operation_type', :enum_class => Flock::Edges::SelectOperationType},
            TERM => {:type => ::Thrift::Types::STRUCT, :name => 'term', :class => Flock::Edges::QueryTerm, :optional => true}
          }

          def struct_fields; FIELDS; end

          def validate
            unless @operation_type.nil? || Flock::Edges::SelectOperationType::VALID_VALUES.include?(@operation_type)
              raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field operation_type!')
            end
          end

        end

        class ExecuteOperation
          include ::Thrift::Struct
          OPERATION_TYPE = 1
          TERM = 2
          POSITION = 3

          ::Thrift::Struct.field_accessor self, :operation_type, :term, :position
          FIELDS = {
            OPERATION_TYPE => {:type => ::Thrift::Types::I32, :name => 'operation_type', :enum_class => Flock::Edges::ExecuteOperationType},
            TERM => {:type => ::Thrift::Types::STRUCT, :name => 'term', :class => Flock::Edges::QueryTerm},
            POSITION => {:type => ::Thrift::Types::I64, :name => 'position', :optional => true}
          }

          def struct_fields; FIELDS; end

          def validate
            unless @operation_type.nil? || Flock::Edges::ExecuteOperationType::VALID_VALUES.include?(@operation_type)
              raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field operation_type!')
            end
          end

        end

        class ExecuteOperations
          include ::Thrift::Struct
          OPERATIONS = 1
          EXECUTE_AT = 2
          PRIORITY = 3

          ::Thrift::Struct.field_accessor self, :operations, :execute_at, :priority
          FIELDS = {
            OPERATIONS => {:type => ::Thrift::Types::LIST, :name => 'operations', :element => {:type => ::Thrift::Types::STRUCT, :class => Flock::Edges::ExecuteOperation}},
            EXECUTE_AT => {:type => ::Thrift::Types::I32, :name => 'execute_at', :optional => true},
            PRIORITY => {:type => ::Thrift::Types::I32, :name => 'priority', :enum_class => Flock::Edges::Priority}
          }

          def struct_fields; FIELDS; end

          def validate
            unless @priority.nil? || Flock::Edges::Priority::VALID_VALUES.include?(@priority)
              raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field priority!')
            end
          end

        end

        class SelectQuery
          include ::Thrift::Struct
          OPERATIONS = 1
          PAGE = 2
          USER_TIMEOUT_MS = 3

          ::Thrift::Struct.field_accessor self, :operations, :page, :user_timeout_ms
          FIELDS = {
            OPERATIONS => {:type => ::Thrift::Types::LIST, :name => 'operations', :element => {:type => ::Thrift::Types::STRUCT, :class => Flock::Edges::SelectOperation}},
            PAGE => {:type => ::Thrift::Types::STRUCT, :name => 'page', :class => Flock::Edges::Page},
            USER_TIMEOUT_MS => {:type => ::Thrift::Types::I32, :name => 'user_timeout_ms', :optional => true}
          }

          def struct_fields; FIELDS; end

          def validate
          end

        end

        class EdgeQuery
          include ::Thrift::Struct
          TERM = 1
          PAGE = 2

          ::Thrift::Struct.field_accessor self, :term, :page
          FIELDS = {
            TERM => {:type => ::Thrift::Types::STRUCT, :name => 'term', :class => Flock::Edges::QueryTerm},
            PAGE => {:type => ::Thrift::Types::STRUCT, :name => 'page', :class => Flock::Edges::Page}
          }

          def struct_fields; FIELDS; end

          def validate
          end

        end

        class EdgeResults
          include ::Thrift::Struct
          EDGES = 1
          NEXT_CURSOR = 2
          PREV_CURSOR = 3

          ::Thrift::Struct.field_accessor self, :edges, :next_cursor, :prev_cursor
          FIELDS = {
            EDGES => {:type => ::Thrift::Types::LIST, :name => 'edges', :element => {:type => ::Thrift::Types::STRUCT, :class => Flock::Edges::Edge}},
            NEXT_CURSOR => {:type => ::Thrift::Types::I64, :name => 'next_cursor'},
            PREV_CURSOR => {:type => ::Thrift::Types::I64, :name => 'prev_cursor'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

        end

      end
    end
