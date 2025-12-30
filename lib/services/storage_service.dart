import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/waiver_form_model.dart';

/// Service for persisting form data locally
class StorageService {
  static const String _formDataKey = 'waiver_form_data';
  static const String _savedFormsKey = 'saved_forms';

  /// Save form data as draft
  static Future<bool> saveDraft(WaiverFormModel form) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(form.toJson());
      return await prefs.setString(_formDataKey, jsonString);
    } catch (e) {
      print('Error saving draft: $e');
      return false;
    }
  }

  /// Load saved draft
  static Future<WaiverFormModel?> loadDraft() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_formDataKey);
      if (jsonString != null) {
        final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
        return WaiverFormModel.fromJson(jsonData);
      }
      return null;
    } catch (e) {
      print('Error loading draft: $e');
      return null;
    }
  }

  /// Clear draft
  static Future<bool> clearDraft() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_formDataKey);
    } catch (e) {
      print('Error clearing draft: $e');
      return false;
    }
  }

  /// Save completed form to list
  static Future<bool> saveCompletedForm(WaiverFormModel form) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedFormsJson = prefs.getString(_savedFormsKey);
      
      List<dynamic> savedForms = [];
      if (savedFormsJson != null) {
        savedForms = jsonDecode(savedFormsJson) as List<dynamic>;
      }
      
      // Add timestamp to form data
      final formWithTimestamp = form.toJson();
      formWithTimestamp['savedAt'] = DateTime.now().toIso8601String();
      
      savedForms.add(formWithTimestamp);
      
      return await prefs.setString(_savedFormsKey, jsonEncode(savedForms));
    } catch (e) {
      print('Error saving completed form: $e');
      return false;
    }
  }

  /// Get all saved forms
  static Future<List<WaiverFormModel>> getSavedForms() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedFormsJson = prefs.getString(_savedFormsKey);
      
      if (savedFormsJson != null) {
        final savedForms = jsonDecode(savedFormsJson) as List<dynamic>;
        return savedForms
            .map((json) => WaiverFormModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting saved forms: $e');
      return [];
    }
  }

  /// Delete all saved forms
  static Future<bool> clearAllSavedForms() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_savedFormsKey);
    } catch (e) {
      print('Error clearing saved forms: $e');
      return false;
    }
  }
}
