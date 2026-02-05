# Firebase Navigation Guide - PantryPal

This guide will help you navigate the Firebase Console for the PantryPal project.

## Accessing Firebase Console

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Sign in with your Google account
3. Select the **PantryPal** project (ID: `pantrypal-ba7d6`)

## Project Overview

Once you're in the PantryPal project, you'll see the main dashboard with quick links to various services.

### Left Sidebar Navigation

The left sidebar contains all Firebase services organized into categories:

#### Build Section
- **Authentication**: Manage user sign-in methods and view registered users
- **Firestore Database**: NoSQL cloud database for storing app data
- **Realtime Database**: Real-time syncing database (older than Firestore)
- **Storage**: Store and serve user-generated content (images, videos, files)
- **Hosting**: Deploy and host web apps
- **Functions**: Serverless backend code
- **Machine Learning**: ML Kit and custom model deployment

#### Release & Monitor Section
- **Crashlytics**: Real-time crash reporting
- **Performance**: Monitor app performance metrics
- **Test Lab**: Test apps on real devices
- **App Distribution**: Distribute pre-release apps to testers

#### Analytics Section
- **Dashboard**: Overview of user engagement and behavior
- **Events**: Track custom events in your app
- **Conversions**: Monitor key user actions
- **Audiences**: Create user segments

#### Engage Section
- **Messaging**: Send push notifications and in-app messages
- **Remote Config**: Update app behavior without deploying new versions
- **A/B Testing**: Test different app variations
- **Dynamic Links**: Deep links that work across platforms

## Key Services for PantryPal

### 1. Authentication
**Path**: Build → Authentication

**What you'll find here**:
- **Users tab**: List of all registered users
- **Sign-in method tab**: Configure authentication providers (Email/Password, Google, etc.)
- **Templates tab**: Customize email templates for password reset, verification, etc.
- **Usage tab**: Monitor authentication usage

**Common Tasks**:
- Enable/disable sign-in methods
- View and manage users
- Customize email templates

### 2. Firestore Database
**Path**: Build → Firestore Database

**What you'll find here**:
- **Data tab**: Browse and edit your database collections and documents
- **Rules tab**: Set security rules for data access
- **Indexes tab**: Manage database indexes for complex queries
- **Usage tab**: Monitor database operations and storage

**Common Tasks**:
- View/edit data in collections
- Update security rules
- Create composite indexes for queries

### 3. Storage
**Path**: Build → Storage

**What you'll find here**:
- **Files tab**: Browse uploaded files
- **Rules tab**: Set security rules for file access
- **Usage tab**: Monitor storage usage

**Common Tasks**:
- View uploaded images/files
- Manage file security rules
- Check storage quota

### 4. Project Settings
**Path**: Click the gear icon ⚙️ next to "Project Overview"

**What you'll find here**:
- **General**: Project details, public-facing name, support email
- **Your apps**: Registered apps (Android, iOS, Web, etc.)
- **Service accounts**: Generate private keys for server-side access
- **Integrations**: Connect to other Google services
- **Cloud Messaging**: Server key for push notifications

**Common Tasks**:
- View app configurations
- Download config files (google-services.json, GoogleService-Info.plist)
- Manage API keys

## Our Flutter App Configuration

Our Flutter app is registered on the following platforms:
- **Web**: App ID `1:782262276223:web:68a25040e5cec9b298ef4a`
- **Android**: App ID `1:782262276223:android:0df6ddb54c42ed6298ef4a`
- **iOS**: App ID `1:782262276223:ios:cde88e0eb3895e1998ef4a`
- **macOS**: App ID `1:782262276223:ios:cde88e0eb3895e1998ef4a`

All configuration is stored in `lib/firebase_options.dart` - **do not manually edit this file**.

## Important Notes

### Security Rules
- Always test security rules before deploying to production
- Default rules may allow public access - review and update them!
- Rules can be found in the "Rules" tab of each service

### Quotas and Billing
- **Free Spark Plan** has limits on:
  - Firestore: 1GB storage, 50K reads/day
  - Authentication: Unlimited
  - Storage: 5GB, 1GB/day download
- Monitor usage in each service's "Usage" tab
- Check overall billing: Project Settings → Usage and billing

### Testing vs Production
- Consider creating separate Firebase projects for development and production
- Use different Google Services config files for each environment
- Current project: **PantryPal** (`pantrypal-ba7d6`)

## Common Workflows

### Viewing App Users
1. Go to **Authentication** → **Users** tab
2. Search by email, UID, or other fields
3. Click on a user to see details and manage their account

### Checking App Data
1. Go to **Firestore Database** → **Data** tab
2. Navigate through collections (folders) and documents (files)
3. Click on a document to view/edit fields
4. Use the filter/query builder for complex searches

### Sending Push Notifications
1. Go to **Messaging** → **Create your first campaign**
2. Select **Firebase Notification message**
3. Fill in notification title and text
4. Select target (all users, specific audience, or topic)
5. Schedule or send immediately

### Debugging Crashes
1. Go to **Crashlytics** (need to add firebase_crashlytics to Flutter app first)
2. View crash reports grouped by issue
3. Click on an issue to see stack traces and affected users
4. Track issue status (open, closed, etc.)

## Getting Help

- **Firebase Documentation**: https://firebase.google.com/docs
- **Flutter Firebase Documentation**: https://firebase.google.com/docs/flutter/setup
- **Stack Overflow**: Tag questions with `firebase` and `flutter`
- **Firebase Support**: Available in console under "Support" in left sidebar

## Quick Links

- [Firebase Console](https://console.firebase.google.com/)
- [PantryPal Project](https://console.firebase.google.com/project/pantrypal-ba7d6)
- [Firebase Status Dashboard](https://status.firebase.google.com/)
- [Firebase Release Notes](https://firebase.google.com/support/release-notes/android)

---

**Last Updated**: February 5, 2026
**Project ID**: pantrypal-ba7d6
**Maintainer**: PantryPal Development Team
