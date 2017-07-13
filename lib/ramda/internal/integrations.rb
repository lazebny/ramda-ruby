# module Ramda
#   module Internal
#     module Integrations
#       module Comparable
#         def ===(other)
#           specifications.find(&other.method(:respond_to?))
#         end
#       end
#
#       class DryMonadsType
#         extend Comparable
#
#         def self.specifications
#           @specifications ||= [
#             :bind,
#             :fmap,
#             :pure,
#           ]
#         end
#       end
#
#       class RamdaFantasyRubyType
#         extend Comparable
#
#         def self.specifications
#           @specifications ||= [
#             :ap,
#             :chain,
#             :map,
#             :of
#           ]
#         end
#       end
#
#       class KleisliType
#         extend Comparable
#
#         def self.specifications
#           @specifications ||= [
#             :'>->',
#             :*,
#             :fmap
#           ]
#         end
#       end
#     end
#   end
# end
